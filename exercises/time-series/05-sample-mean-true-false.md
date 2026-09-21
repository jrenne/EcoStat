---
id: "time-series-sample-mean-true-false"
title: "Serial dependence and the sample mean: true or false?"
difficulty: "Advanced"
type: "True or false"
related: "TS"
source_exercise: 53
---

## Statement
Consider a covariance-stationary process $y_t$ whose first auto-covariances are $\gamma_0=4$, $\gamma_1=3$, $\gamma_2=2$, $\gamma_3=1$, and $\gamma_i=0$ for $i>3$. Assume also that the process satisfies the moment and weak-dependence conditions needed for the central limit theorem.

Note that this implies that $$\sum_{i=-\infty}^{+\infty}\gamma_i
=
\gamma_0 + 2\sum_{i=1}^{\infty}\gamma_i
=
4 + 2\times 3 + 2\times 2 + 2\times 1
=
16.$$

We use the notation $\bar{y}_T=\displaystyle \frac{1}{T}\sum_{t=1}^T y_t$. The unconditional expectation of $y_t$ is denoted by $\mu$, i.e. $\mathbb{E}(y_t)=\mu$.

For each statement, decide whether it is true or false and justify your answer.

1. The variance of $y_t+y_{t-1}$ is equal to 14.

2. We have $\mathbb{V}ar(y_{t-2})=\gamma_2$.

3. For a large $T$, the distribution of $\sqrt{T}(\bar{y}_T-\mu)$ is approximately $\mathcal{N}(0,16)$.

4. For a large $T$, the variance of $\sqrt{T}(\bar{y}_T-\mu)$ is approximately equal to $4$.

5. For $T=1600$, and if $\bar{y}_T=0.1$, then $0$ is outside an approximated 95% confidence interval for $\mu$.
