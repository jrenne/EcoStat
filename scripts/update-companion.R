# Explicit maintenance operation: select a reviewed source archive, then review Git diff.
# Usage: Rscript --vanilla scripts/update-companion.R /path/to/Package_version.tar.gz
if (dir.exists("renv/library")) .libPaths(c(normalizePath("renv/library"), .libPaths()))
args <- commandArgs(trailingOnly=TRUE)
if (length(args)!=1L || !file.exists('packages/manifest.tsv')) {
  stop('Run from the course root with one reviewed source archive')
}
archive <- normalizePath(args[1],mustWork=TRUE)
members <- utils::untar(archive,list=TRUE)
description <- grep('^[^/]+/DESCRIPTION$',members,value=TRUE)
if (length(description)!=1L) stop('Expected one package DESCRIPTION')
folder <- tempfile('companion-description-');dir.create(folder)
utils::untar(archive,files=description,exdir=folder)
metadata <- read.dcf(file.path(folder,description))
unlink(folder,recursive=TRUE)
manifest <- utils::read.delim('packages/manifest.tsv',stringsAsFactors=FALSE)
if (nrow(manifest)!=1L || metadata[1,'Package']!=manifest$package) {
  stop('Archive package does not match this course')
}
filename <- paste0(metadata[1,'Package'],'_',metadata[1,'Version'],'.tar.gz')
target <- file.path('packages',filename)
if (normalizePath(target,mustWork=FALSE)!=archive &&
    !file.copy(archive,target,overwrite=TRUE)) stop('Could not copy archive')
manifest$version <- metadata[1,'Version']
manifest$file <- filename
manifest$sha256 <- digest::digest(file=target,algo='sha256')
utils::write.table(manifest,'packages/manifest.tsv',sep='\t',quote=FALSE,row.names=FALSE)
cat('Updated the explicit companion selection. Rebuild HTML/PDF and review the source/archive diff before committing.\n')
