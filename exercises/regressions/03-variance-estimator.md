---
id: "regressions-variance-estimator"
title: "Unbiased estimation of the error variance"
difficulty: "Advanced"
type: "Proof"
related: "LSquares"
source_exercise: 29
---

## Statement
Consider the linear model: $$y_i = \beta_1 x_{i,1} + \beta_2 x_{i,2} + \cdots + \beta_K x_{i,K} + \varepsilon_i = \mathbf{x}_i'\boldsymbol{\beta} + \varepsilon_i, \quad i = 1, \dots, n.$$ We assume that Assumptions 4.1 (full rank), 4.2 (conditional mean zero), 4.3 (homoskedasticity), and 4.4 (non-correlated residuals) hold.

Let $\mathbf{b}$ be the estimator of $\boldsymbol{\beta}$ and let $s^2$ be the OLS estimator of $\sigma^2$. The estimator $s^2$ is defined by: $$s^2 = \frac{\mathbf{e}'\mathbf{e}}{n - K}, \quad \text{where } \mathbf{e} = \mathbf{y} - \mathbf{X}\mathbf{b}.$$

1.  Write the model above in matrix form: $$\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon},$$ clarifying how $\mathbf{y}$, $\mathbf{X}$, $\boldsymbol{\beta}$, and $\boldsymbol{\varepsilon}$ are defined and their dimensions.

2.  Show that the estimated residuals are orthogonal to the explanatory variables.

3.  Show that if the model contains an intercept, the estimated residuals have mean zero.

4.  Show that if the columns of $\mathbf{X}$ are orthogonal, the estimator of $\beta_j$ in the model above coincides with that of $\beta_j$ in $y_i = \beta_j x_{i,j} + u_i, \quad i = 1, \dots, n$.

5.  Show that $s^2$ is conditionally unbiased for $\sigma^2$.
