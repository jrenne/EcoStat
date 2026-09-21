---
id: "clt-payoff-true-false"
title: "Repeated-payoff game: true or false?"
difficulty: "Standard"
type: "True or false"
related: "TCL"
source_exercise: 22
---

## Statement
We consider a repeated game. The payoff of each round is:

-   $-2$ with probability $\dfrac{1}{2}$,

-   $7$ with probability $\dfrac{1}{7}$,

-   $0$ otherwise.

We play $n$ rounds ($n$ is large). Payoffs are independent across rounds. Let $x_i$ be the payoff in round $i$, and let $$z_n=\sum_{i=1}^n x_i
\qquad\text{so that}\qquad
z_n=n\bar{x}_n,
\quad
\bar{x}_n=\frac{1}{n}\sum_{i=1}^n x_i.$$ We note that $\mathbb{E}(x_i)=0$ and we admit (without calculation) that $\mathbb{V}ar(x_i)=9$.

For each statement, decide whether it is true or false and justify your answer.

1. $\mathbb{V}ar(z_n)=9$.

2. $z_n$ approximately follows a Normal distribution of mean $0$ and variance $9n$.

3. If $n=900$, an interval containing approximately 95% of the sampling distribution of $\bar{x}_n$ is $[-1.96,1.96]$.

4. We approximately have $\bar{x}_n \sim \mathcal{N}(0,9)$.

5. $\mathbb{P}(z_n<0)$ and $\mathbb{P}(z_n>0)$ are close to $\dfrac{1}{2}$.
