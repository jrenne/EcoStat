---
id: "estimation-bayesian-normal-mean"
title: "Bayesian updating for a normal mean"
difficulty: "Standard"
type: "Calculation"
related: "secMLE"
source_exercise: 61
---

## Statement

Conditional on $\mu$, let $Y_1,\dots,Y_n$ be i.i.d. $\mathcal{N}(\mu,\sigma^2)$, where $\sigma^2$ is known. The prior is $\mu\sim\mathcal{N}(m_0,v_0)$.

1. Show that the posterior distribution is $\mathcal{N}(m_n,v_n)$, where
$$
v_n=\left(\frac1{v_0}+\frac n{\sigma^2}\right)^{-1},
\qquad
m_n=v_n\left(\frac{m_0}{v_0}+\frac{n\bar Y_n}{\sigma^2}\right).
$$
2. Interpret $m_n$ as a precision-weighted average of the prior mean and sample mean.
3. Compute the posterior mean and variance when $m_0=0$, $v_0=1$, $\sigma^2=4$, $n=4$, and $\bar Y_n=3$.
4. Give a central approximate 95% posterior credible interval for $\mu$ using 1.96 as the normal critical value.
5. Derive the posterior predictive distribution of a new observation $Y_{n+1}$.
