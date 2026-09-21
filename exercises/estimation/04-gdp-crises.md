---
id: "estimation-gdp-crises"
title: "Maximum likelihood with GDP crises"
difficulty: "Advanced"
type: "Application"
related: "secMLE"
source_exercise: 42
---

## Statement
We denote by $y_t$ the GDP growth rate of year $t$. This growth rate is given by:

$$y_t = \varepsilon_t - \gamma d_t,$$

where the variables $d_t$ and $\varepsilon_t$ are independent. More precisely: (i) for $s \neq t$, $d_t$ and $d_s$ are independent, as well as $\varepsilon_t$ and $\varepsilon_s$, and (ii) for any $t$ and $s$, $d_t$ and $\varepsilon_s$ are independent. The variable $d_t$ is a crisis indicator (with $\gamma > 0$).

We assume that $d_t \sim i.i.d.\mathcal{B}(p)$, where $\mathcal{B}(p)$ denotes a Bernoulli distribution with parameter $p$ and $\varepsilon_t \sim i.i.d.\mathcal{N}(\mu,\sigma^2)$.

Our estimation sample is of length $T$. We want to estimate $\theta = [p, \gamma, \mu, \sigma^2]'$. Crucially, we assume that the crisis variables $d_t$ are not observed; that is, we observe $y_t$ only.

1.  Express the distribution of $y_t$ conditional to $d_t = 0$ (denoted by $f(y_t|d_t = 0; \theta)$) and the distribution of $y_t$ conditional to $d_t = 1$ (denoted by $f(y_t|d_t = 1; \theta)$).

2.  Show that $f(y_t; \theta) = p f(y_t|d_t = 1; \theta) + (1 - p) f(y_t|d_t = 0; \theta)$.

3.  Write the log-likelihood $\log \mathcal{L}(\mathbf{y}; \theta)$.

The log-likelihood is maximized numerically. The value of $\theta$ for which the likelihood is maximized is $\hat{\theta} = [0.04, 2.90, 2.50, 1.10]'$ (the values of $y_t$ are expressed in percentage points). The inverse of the Hessian matrix of the log-likelihood, computed at $\hat{\theta}$, is:

$$H = \left( \frac{\partial^2 \log \mathcal{L}(\hat{\theta}; \mathbf{y})}{\partial \theta \partial \theta'} \right)^{-1} =
\begin{bmatrix}
-0.000100 & -0.000015 & -0.000025 & -0.000020 \\
-0.000015 & -0.160002 & 0.019996 & 0.004003 \\
-0.000025 & 0.019996 & -0.042056 & -0.001505 \\
-0.000020 & 0.004003 & -0.001505 & -0.250204
\end{bmatrix}$$

4.  How to approximate the asymptotic distribution of $\hat{\theta}$?

5.  Compute a 95% confidence interval for $\gamma$.

6.  How can the asymptotic variance of $\hat{\gamma}-\hat{\mu}$ be approximated? Test $H_0:\gamma=\mu$ at the 5% significance level.
