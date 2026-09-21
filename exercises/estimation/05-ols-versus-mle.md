---
id: "estimation-ols-versus-mle"
title: "OLS and maximum likelihood"
difficulty: "Standard"
type: "Proof"
related: "secMLE"
source_exercise: 43
---

## Statement
Consider the linear model $$y_i = \beta_1 x_{i,1} + \beta_2 x_{i,2} + \cdots + \beta_K x_{i,K} + \varepsilon_i = \mathbf{x}_i' \boldsymbol{\beta} + \varepsilon_i, \quad i = 1, \dots, n,$$ and assume that Assumptions 4.1 to 4.5 of the course on linear regressions hold for this model. Let $\mathbf{b}_{ML}$ be the maximum-likelihood estimator of $\boldsymbol{\beta}$ and let $\sigma^2_{ML}$ be the ML estimator of $\sigma^2$.

1.  Show that $\mathbf{b}_{ML} = \mathbf{b}$, where $\mathbf{b}$ is the OLS estimator of $\boldsymbol{\beta}$.

2.  Compute $\sigma^2_{ML}$.

3.  Show that $\sigma^2_{ML}$ is biased.

4.  Show that $\sigma^2_{ML}$ is consistent.
