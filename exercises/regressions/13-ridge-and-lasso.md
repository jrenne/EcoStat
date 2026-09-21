---
id: "regressions-ridge-and-lasso"
title: "Ridge shrinkage in an orthogonal design"
difficulty: "Advanced"
type: "Analytical"
related: "shrinkage"
source_exercise: 57
---

## Statement

Consider the centered linear model $\mathbf y=\mathbf X\boldsymbol\beta+\boldsymbol\varepsilon$, where $\mathbb{E}(\boldsymbol\varepsilon\mid\mathbf X)=\mathbf0$, $\mathbb{V}ar(\boldsymbol\varepsilon\mid\mathbf X)=\sigma^2\mathbf I$, and $\mathbf X'\mathbf X=n\mathbf I_K$. The ridge estimator minimizes
$$
(\mathbf y-\mathbf X\mathbf b)'(\mathbf y-\mathbf X\mathbf b)+\lambda\mathbf b'\mathbf b,
\qquad \lambda\ge0.
$$

1. Derive the ridge estimator and show that $\mathbf b_R=\frac{n}{n+\lambda}\mathbf b_{OLS}$.
2. Compute $\mathbb{E}(\mathbf b_R\mid\mathbf X)$ and its conditional bias.
3. Compute $\mathbb{V}ar(\mathbf b_R\mid\mathbf X)$ and compare it with the conditional variance of OLS.
4. Explain the bias--variance trade-off created by increasing $\lambda$.
5. Ridge generally does not set coefficients exactly to zero. Which feature of the lasso penalty can produce exact zeros?
