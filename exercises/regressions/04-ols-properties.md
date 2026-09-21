---
id: "regressions-ols-properties"
title: "OLS assumptions, confidence intervals, and tests"
difficulty: "Standard"
type: "Analytical"
related: "LSquares"
source_exercise: 30
---

## Statement
*Verbeek (2004), exercise 2.1 (slightly modified)*

Consider the linear model $$y_i = \beta_1 + \beta_2 x_{i,2} + \beta_3 x_{i,3} + \varepsilon_i = \mathbf{x}_i' \boldsymbol{\beta} + \varepsilon_i, \quad i = 1, \dots, n,$$

Let $\mathbf{b}$ be the estimator of $\boldsymbol{\beta} = [\beta_1, \beta_2, \beta_3]'$ and let $s^2$ be the OLS estimator of $\sigma^2$. Assume that $n$ is large.

1.  Express $\mathbf{b}$.

2.  Which assumptions are needed to make $\mathbf{b}$ an unbiased estimator for $\boldsymbol{\beta}$?

3.  Explain how a confidence interval for $\beta_2$ can be constructed. Which additional assumptions are needed?

4.  Explain how one can test the hypothesis that $\beta_3 = 1$.

5.  Explain how one can test the joint hypothesis that $\beta_2 + \beta_3 = 0$ and $\beta_1 = 2$.

6.  Explain how one can test the hypothesis that $\beta_2 = \beta_3 = 0$.

7.  Suppose that $\lim_{n \to \infty} \frac{1}{n} \mathbf{X}'\mathbf{X} = \mathbf{Q}$ and that all $(y_i, x_{i,2}, x_{i,3})$ are independent across $i$. Which assumptions are needed to make $\mathbf{b}$ a consistent estimator for $\boldsymbol{\beta}$?

8.  Suppose that $x_{i,2} = 2 + 3x_{i,3}$. What will happen if you try to estimate the linear model above?

9.  Suppose that the model is estimated with $x_{i,2}^* = 2x_{i,2} - 2$ included rather than $x_{i,2}$. How are the coefficients in this model related to those in the original model above? And the $R^2$s?
