---
id: "regressions-projection-matrix-true-false"
title: "Projection matrices and OLS residuals: true or false?"
difficulty: "Standard"
type: "True or false"
related: "LSquares"
source_exercise: 54
---

## Statement
Consider the multiple linear regression model in matrix form: $$\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol\varepsilon.$$ $\mathbf{y}$ is a $n \times 1$ vector (dependent variable), $\mathbf{X}$ is a $n \times K$ matrix (the first column is a constant and the remaining $K-1$ columns are explanatory variables), $\boldsymbol{\beta}$ is a $K \times 1$ vector (coefficients), and $\boldsymbol\varepsilon$ is a $n \times 1$ vector (error term). We denote $\mathbf{b}$ as the OLS estimator of $\boldsymbol{\beta}$. The residuals are $$\mathbf{e} = \mathbf{y} - \mathbf{X}\mathbf{b}.$$ We denote $$\mathbf{P} = \mathbf{X}(\mathbf{X'X})^{-1}\mathbf{X'}$$ as the projection matrix (which exists).

For each statement, decide whether it is true or false and justify your answer.

1. For $\mathbf{b}$ to be unbiased we do not need homoskedasticity in the errors.

2. The OLS estimator is necessarily biased if the error term does not follow a normal distribution.

3. $\mathbf{PPX} = \mathbf{PX}$.

4. The fact that $\mathbf{X}$ is orthogonal to $\mathbf{e}$ $(\mathbf{X}'\mathbf{e} = \mathbf{0})$ suggests that our OLS estimator is unbiased.

5. $\boldsymbol\varepsilon = \mathbf{My}$, where $\mathbf{M} = \mathbf{I} - \mathbf{X}(\mathbf{X'X})^{-1}\mathbf{X'}$.
