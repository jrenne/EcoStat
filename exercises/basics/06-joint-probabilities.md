---
id: "basics-joint-probabilities"
title: "Employment, residence, and independence"
difficulty: "Standard"
type: "Calculation"
related: "basics-discrete"
source_exercise: 6
---

## Statement

Let $X$ indicate employment status ($0$: employed; $1$: self-employed), and let $Y$ indicate residence ($0$: countryside; $1$: city). Their joint probabilities are:

| | $Y=0$ | $Y=1$ |
|:--|--:|--:|
| $X=0$ | 0.10 | 0.30 |
| $X=1$ | 0.15 | 0.45 |

For each statement, decide whether it is true or false and justify your answer.

1. $\mathbb{E}(X)=0.7$.
2. $X$ and $Y$ are not independent.
3. $\mathbb{V}ar(X)=\mathbb{V}ar(X\mid Y=0)+\mathbb{V}ar(X\mid Y=1)$.
4. $\mathbb{V}ar(X\mid Y=0)=0.24$.
5. Bayes' rule implies
$$
\begin{gathered}
\mathbb{P}(X=0\mid Y=0)\\
=\frac{\mathbb{P}(Y=0\mid X=0)\mathbb{P}(X=0)}
{\mathbb{P}(Y=0\mid X=0)\mathbb{P}(X=0)+\mathbb{P}(Y=0\mid X=1)\mathbb{P}(X=1)}.
\end{gathered}
$$
6. The correlation between $X$ and $Y$ is strictly positive.
