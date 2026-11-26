"""Check source citations/notation and every internal link of the rendered book.

Run from the book directory after a complete HTML/PDF build. Standard library only.
This does not contact external sites or validate the contents of cited sources.
"""
from collections import Counter
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit
import re

root = Path.cwd()
docs = root / 'docs'
errors = []

class Page(HTMLParser):
    def __init__(self, path):
        super().__init__(convert_charrefs=True)
        self.path, self.ids, self.hrefs = path, set(), []
        self.feed(path.read_text())
    def handle_starttag(self, tag, attributes):
        attrs = dict(attributes)
        if 'id' in attrs:
            self.ids.add(attrs['id'])
        if tag == 'a' and 'href' in attrs:
            self.hrefs.append(attrs['href'])

# Follow only pages linked by the current book, avoiding obsolete output files.
pending = [docs / 'index.html']
pages = {}
link_count = 0
while pending:
    path = pending.pop().resolve()
    if path in pages:
        continue
    if not path.exists():
        errors.append(f'Missing HTML page: {path}')
        continue
    page = pages[path] = Page(path)
    for href in page.hrefs:
        target = urlsplit(href)
        if target.scheme or target.netloc:
            continue
        destination = (path.parent / unquote(target.path)).resolve() if target.path else path
        if destination.suffix == '.html' and destination.is_relative_to(docs.resolve()):
            link_count += 1
            if destination not in pages:
                pending.append(destination)

for path, page in pages.items():
    for href in page.hrefs:
        target = urlsplit(href)
        if target.scheme or target.netloc or not target.fragment:
            continue
        destination = (path.parent / unquote(target.path)).resolve() if target.path else path
        if destination in pages and unquote(target.fragment) not in pages[destination].ids:
            errors.append(f'{path.name}: unresolved anchor {href}')

sources = [root / 'index.Rmd', *sorted(root.glob('0[1-9]*.Rmd'))]
sources += sorted((root / 'exercises').rglob('*.md'))
bibliography = '\n'.join(p.read_text() for p in (root / 'book.bib', root / 'packages.bib'))
keys = set(re.findall(r'@\w+\s*\{\s*([^,\s]+)', bibliography))
chunk_labels = []
references = []
for path in sources:
    source = re.sub(r'<!--.*?-->', '', path.read_text(), flags=re.S)
    for label in re.findall(r'^```\{r\s+([^,}\s]+)', source, re.M):
        chunk_labels.append((label, path.name))
    prose = re.sub(r'^```.*?^```\s*$', '', source, flags=re.M | re.S)
    for key in re.findall(r'(?<![\\\w])@([A-Za-z][\w:.-]*)', prose):
        if key not in keys and key.rstrip(".") not in keys:
            errors.append(f'{path.name}: missing bibliography key {key}')
    for forbidden in (r'\mathrm{Id}', r'\mathcal{I}('):
        if forbidden in prose:
            errors.append(f'{path.name}: inconsistent notation {forbidden}')
    if re.search(r'`var\(\)`', prose):
        errors.append(f'{path.name}: R variance function mentioned in prose')
    if re.search(r'\b(?:USyields|JST|SHP|RANDHRS|Fishing)\b|AEC::credit\b', source):
        errors.append(f'{path.name}: legacy dataset in active course content')
    for kind, target in re.findall(
        r'(Definition|Def\.|Proposition|Prop\.|Theorem|Hypothesis|Assumption|Equation|Eq\.|Figure|Table|Example|Exercise)\s+\\@ref\(([^)]+)\)', prose):
        expected = {'Definition':'def:', 'Def.':'def:', 'Proposition':'prp:',
            'Prop.':'prp:', 'Theorem':'thm:', 'Hypothesis':'hyp:', 'Assumption':'hyp:',
            'Equation':'eq:', 'Eq.':'eq:', 'Figure':'fig:', 'Table':'tab:',
            'Example':'exm:', 'Exercise':'exr:'}[kind]
        if not target.startswith(expected):
            errors.append(f'{path.name}: {kind} refers to {target}')
    references += re.findall(r'\\@ref\(([^)]+)\)', prose)

for label, count in Counter(label for label, _ in chunk_labels).items():
    if count > 1:
        errors.append(f'Duplicate active chunk label: {label}')

# The TeX labels include dynamically generated tables and exercise labels.
tex = (docs / 'EcoStat.tex').read_text()
labels = re.findall(r'\\label\{([^}]+)\}', tex)
for label, count in Counter(labels).items():
    if count > 1:
        errors.append(f'Duplicate TeX label: {label}')
for target in sorted(set(references) - set(labels)):
    # Unnumbered HTML-only headings are not necessarily emitted as TeX labels.
    if not any(target in page.ids for page in pages.values()):
        errors.append(f'Unresolved source reference: {target}')

if errors:
    raise SystemExit('\n'.join(sorted(set(errors))))
print(f'PASS: {len(pages)} HTML pages, {link_count} internal page links, '
      f'{len(references)} source cross-references, citations and notation.')
