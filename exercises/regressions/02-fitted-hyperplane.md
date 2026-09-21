---
id: "regressions-fitted-hyperplane"
title: "The fitted hyperplane and sample averages"
difficulty: "Standard"
type: "Proof"
related: "LSquares"
source_exercise: 28
---

## Statement
Consider the linear model: $$y_i = \beta_1 x_{i,1} + \beta_2 x_{i,2} + \cdots + \beta_K x_{i,K} + \varepsilon_i = \mathbf{x}_i'\boldsymbol{\beta} + \varepsilon_i, \quad i = 1, \dots, n.$$ We assume that Assumptions 4.1 (full rank), 4.2 (conditional mean zero), 4.3 (homoskedasticity), 4.4 (non-correlated residuals) of the course hold. We further assume that $x_{i,1} = 1$ for all $i$.

1.  Show that the hyperplane of the regression passes through the average of the data, i.e., $$\bar{y} = \bar{\mathbf{x}}'\mathbf{b},$$ where $$\bar{y} = \frac{1}{n} \sum_{i=1}^n y_i, \quad \bar{\mathbf{x}} = \frac{1}{n} \sum_{i=1}^n \mathbf{x}_i,$$ and where $\mathbf{b}$ is the OLS estimator of $\boldsymbol{\beta} = [\beta_1, \dots, \beta_K]'$.

2.  Show that the mean of the fitted values ($= \mathbf{X}\mathbf{b}$) is equal to the mean of the actual values, i.e., $$\bar{y} = \frac{1}{n} \sum_{i=1}^n \hat{y}_i,$$ where $\hat{y}_i = \mathbf{b}'\mathbf{x}_i$.

3.  The $R^2$ coefficient is defined by $$R^2 = \frac{\sum_{i=1}^n (\hat{y}_i - \bar{y})^2}{\sum_{i=1}^n (y_i - \bar{y})^2}.$$ Show that $\sum_{i=1}^n (y_i - \bar{y})^2 = \sum_{i=1}^n (y_i - \hat{y}_i)^2 + \sum_{i=1}^n (\hat{y}_i - \bar{y})^2$, and deduce that $R^2$ is between 0 and 1.
