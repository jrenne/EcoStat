---
id: "regressions-ols-matrix-true-false"
title: "OLS matrices and residuals: true or false?"
difficulty: "Standard"
type: "True or false"
related: "LSquares"
source_exercise: 32
---

## Statement
We assume that the Gauss--Markov assumptions (4.1 to 4.4 from the course) are satisfied in the model $$y_i=\mathbf{x}_i'\boldsymbol\beta+\varepsilon_i,
\qquad
\mathbb{V}ar(\varepsilon_i|\mathbf{X})=\sigma^2.$$ The model includes a constant (the first component $x_{i,1}=1$ for all $i$). The dimension of $\mathbf{x}_i$ is $K\times 1$, with $K>1$.

We consider the OLS regression of $y_i$ on $\mathbf{x}_i$. We denote by $\mathbf{b}$ the OLS estimator of $\boldsymbol\beta$. We denote by $\mathbf{e}$ the vector of residuals, $\mathbf{e}=\mathbf{y}-\mathbf{X}\mathbf{b}$, where $\mathbf{X}$ is the $n\times K$ matrix whose $i$th row is $\mathbf{x}_i'$, and $\mathbf{y}=[y_1,\dots,y_n]'$.

We assume that $n$ is large, that $\{\mathbf{x}_i,\varepsilon_i\}$ are i.i.d. across individuals $i$, and that $\mathbf{X}'\mathbf{X}/n$ converges to an invertible matrix $Q$.

We set $s^2=\mathbf{e}'\mathbf{e}/(n-K)$ and denote by $v_k$ the $k$th diagonal element of $(\mathbf{X}'\mathbf{X})^{-1}$.

For each statement, decide whether it is true or false and justify your answer.

1. $s^2=\sigma^2$.

2. The sum of the OLS residuals $e_i$ is equal to zero.

3. The distribution of the OLS estimator is approximately Gaussian only if the errors $\varepsilon_i$ are Gaussian.

4. For $k=1,\dots,K$, the distribution of $b_k-\beta_k$ is approximately $\mathcal{N}(0,s^2 v_k)$.

5. The coefficient of determination ($R^2$) is strictly larger than 0.
