---
id: "estimation-ols-mle-numerical"
title: "Numerical comparison of OLS and ML inference"
difficulty: "Standard"
type: "Calculation"
related: "secMLE"
source_exercise: 44
---

## Statement
Consider the Gaussian linear model of the preceding exercise, with $K = 4$. We have a sample of size $n = 8$. We obtain (with the usual notations):

$$(\mathbf{X}'\mathbf{X})^{-1} =
\begin{pmatrix}
3 & 2 & 2 & 0 \\
2 & 2 & 1 & 0 \\
2 & 1 & 2 & 0 \\
0 & 0 & 0 & 1
\end{pmatrix},
\quad
\mathbf{b} =
\begin{pmatrix}
1 \\
2 \\
7 \\
7
\end{pmatrix},
\quad
\mathbf{e}'\mathbf{e} = 8$$

1.  Compute $\sigma^2_{ML}$ and $\sigma^2_{OLS}$ ($\sigma^2_{OLS}$ is the OLS-based estimate of $\sigma^2$, that we often denote by $s^2$).

2.  Let $F_{ML}$ and $F_{OLS}$ be the test statistics for $H_0: \mathbf{R}\boldsymbol{\beta} = \mathbf{q}$ when $\sigma^2_{ML}$ and $\sigma^2_{OLS}$ are used, respectively. Show that $F_{OLS} = \frac{F_{ML}}{2}$.

3.  Compute $F_{ML}$ and $F_{OLS}$ for the null hypothesis $H_0: \beta_2 + \beta_3 = \beta_1 + \beta_4 = 10$. (No final calculation is needed, only write down the matrix form of the calculations that give the test statistics.)

4.  What are the main issues associated with the use of an F-test based on a Maximum Likelihood estimation (in a small sample)?
