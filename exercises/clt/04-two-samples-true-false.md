---
id: "clt-two-samples-true-false"
title: "Comparing two sample means: true or false?"
difficulty: "Standard"
type: "True or false"
related: "TCL"
source_exercise: 23
---

## Statement
We have two samples, each of size $n$ where $n$ is large. The first sample is $\{x_1,\dots,x_n\}$ and the second sample is $\{y_1,\dots,y_n\}$. We assume that all observations are independent (within and across samples). The $x_i$ are drawn from a distribution with mean $\mu_x$ and variance $\sigma_x^2$, and the $y_i$ are drawn from a distribution with mean $\mu_y$ and variance $\sigma_y^2$.

We denote by $\bar{x}_n$ and $\bar{y}_n$ the sample means: $$\bar{x}_n=\frac{1}{n}\sum_{i=1}^n x_i,
\qquad
\bar{y}_n=\frac{1}{n}\sum_{i=1}^n y_i.$$

For each statement, decide whether it is true or false and justify your answer.

1. The distribution of $\bar{x}_n-\mu_x$ is approximately $\mathcal{N}(0,\sigma_x^2)$.

2. The variance of $\bar{x}_n$ is $\sigma_x^2$.

3. If $\mu_x=\mu_y$, the distribution of $\sqrt{n}(\bar{x}_n-\bar{y}_n)$ is approximately $\mathcal{N}(0,\sigma_x^2+\sigma_y^2)$.

4. If $\sigma_x^2=\sigma_y^2=0.5$, $\bar{x}_n=1$, $\bar{y}_n=1.1$, and $n=900$, a test of mean comparison cannot reject $H_0:\mu_x=\mu_y$ at the 5% significance level.

5. $\bar{x}_n-\bar{y}_n$ is a consistent estimator of $\mu_x-\mu_y$.
