---
id: "regressions-ols-inference"
title: "OLS inference in a three-regressor model"
difficulty: "Standard"
type: "Analytical"
related: "LSquares"
source_exercise: 27
---

## Statement
We consider the following linear regression: $$y_i = \beta_1 x_{i,1} + \beta_2 x_{i,2} + \beta_3 x_{i,3} + \varepsilon_i,$$ where $x_{i,1} = 1$ for all $i$. We observe $(y_i, x_{i,2}, x_{i,3})$, for $i \in \{1, \dots, n\}$, with $n = 200$.

In matrix notation, the linear regression writes: $$\mathbf{y} = \boldsymbol{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}.$$ The OLS estimator of $\boldsymbol{\beta} = [\beta_1, \beta_2, \beta_3]'$ is denoted by $\mathbf{b}$.\
We suppose that the standard full-rank, conditional-mean-zero, homoskedasticity, and no-cross-correlation assumptions hold. We additionally assume normally distributed errors.

1.  The OLS estimates of the disturbances $\varepsilon_i$ are denoted by $e_i$. Show that $\bar{e}_n = 0$.

2.  Show that if $\mathbb{E}(\boldsymbol{\varepsilon} | \boldsymbol{X}) = 0$, the OLS estimator of $\boldsymbol{\beta}$ is unbiased.

3.  The correlation between $x_{i,2}$ and $x_{i,3}$ is 0.98. What does it imply for the $\mathbf{b}$ estimator? (No computation is required here, just a brief explanation.)\
    In the following, we assume that $\beta_3 = 0$ and that the Gauss--Markov assumptions are satisfied. In the formulas below, $\boldsymbol{X}$ denotes the $n\times2$ design matrix of the reduced model $y_i = \beta_1 + \beta_2 x_{i,2} + \varepsilon_i$. Its OLS estimation gives $b_2 = 1.2$, a residual sum of squares of 181, and $$(\boldsymbol{X}'\boldsymbol{X})^{-1} =
    \begin{bmatrix}
    1.1 & 0.4 \\
    0.4 & 0.25
    \end{bmatrix}.$$

4.  Give an estimate of $\mathbb{V}ar(b_2|\boldsymbol{X})$.

5.  Compute an approximate 95% confidence interval for $\beta_2$. You will also briefly explain why you can compute such an interval in the present case.
