---
id: "binary-probit-mle-true-false"
title: "Probit maximum likelihood: true or false?"
difficulty: "Advanced"
type: "True or false"
related: "marginalFX"
source_exercise: 48
---

## Statement
Consider a random variable whose observations $y_i$ are independent and drawn from a Bernoulli distribution with parameter $\Phi(\boldsymbol{\theta}'\mathbf{x}_i)$, where $\Phi$ is the c.d.f. of a standard normal distribution $\mathcal{N}(0,1)$.

The explanatory variables $\mathbf{x}_i=[x_{i,1},\dots,x_{i,K}]'$ are regarded as non-random variables. The parameter vector $\boldsymbol{\theta}=[\theta_1,\dots,\theta_K]'$ is estimated by Maximum Likelihood. The number of observations is large.

For each statement, decide whether it is true or false and justify your answer.

1. The conditional variance of $y_i$ given $\mathbf{x}_i$ is strictly larger than 1.

2. If $\theta_1>0$, an increase in $x_{i,1}$ (everything else equal) necessarily leads to a decrease in $\mathbb{P}(y_i=1|\mathbf{x}_i)$.

3. $\mathbb{E}(y_i|\mathbf{x}_i;\boldsymbol{\theta})=\Phi(\boldsymbol{\theta}'\mathbf{x}_i)$.

4. By adding three explanatory variables ($x_{i,K+1}$, $x_{i,K+2}$, and $x_{i,K+3}$), the maximum log-likelihood increases by 2.5. A likelihood ratio test at the 5% significance level leads us to reject the null hypothesis that $\theta_{K+1}=\theta_{K+2}=\theta_{K+3}=0$.

5. This model is a probit model.
