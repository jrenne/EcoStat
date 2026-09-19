---
id: "basics-joint-probabilities"
title: "Employment, residence, and independence"
difficulty: "Standard"
type: "Conceptual / calculation"
related: "basics-bayes"
source_exercise: 6
---

## Statement

Let $X$ indicate employment status ($0$: employed; $1$: self-employed), and let $Y$ indicate residence ($0$: countryside; $1$: city). Their joint probabilities are:

| | $Y=0$ | $Y=1$ |
|:--|--:|--:|
| $X=0$ | 0.10 | 0.30 |
| $X=1$ | 0.15 | 0.45 |

For each statement, decide whether it is true or false and justify your answer.

(a) $\mathbb{E}(X)=0.7$.
(b) $X$ and $Y$ are not independent.
(c) $\operatorname{Var}(X)=\operatorname{Var}(X\mid Y=0)+\operatorname{Var}(X\mid Y=1)$.
(d) $\operatorname{Var}(X\mid Y=0)=0.24$.
(e) Bayes' rule implies
$$
\mathbb{P}(X=0\mid Y=0)=
\frac{\mathbb{P}(Y=0\mid X=0)\mathbb{P}(X=0)}
{\mathbb{P}(Y=0\mid X=0)\mathbb{P}(X=0)+\mathbb{P}(Y=0\mid X=1)\mathbb{P}(X=1)}.
$$
(f) The correlation between $X$ and $Y$ is strictly positive.
