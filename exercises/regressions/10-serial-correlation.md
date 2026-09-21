---
id: "regressions-serial-correlation"
title: "A regression with MA(1) errors"
difficulty: "Advanced"
type: "Analytical"
related: "ChapterLS"
source_exercise: 36
---

## Statement
We consider the model:

$$y_i = \beta_1 x_{i,1} + \cdots + \beta_K x_{i,K} + \varepsilon_i,$$

where $\varepsilon_i = u_i + \delta u_{i-1}$.

There is no collinear relationship among the explanatory variables $x_{i,k}$. The $u_i$ are i.i.d. $\mathcal{N}(0, \sigma^2)$. These disturbances $u_i$ are independent from the $\mathbf{x}_j = [x_{j,1},\dots,x_{j,K}]'$.

We denote by $\mathbf{X}$ the matrix whose $(i,k)$ entry is $x_{i,k}$ and by $\boldsymbol{\varepsilon}$ the vector $[\varepsilon_1,\dots,\varepsilon_n]'$. The sample size is denoted by $n$.

1.  Compute $\mathbb{E}(\boldsymbol{\varepsilon})$ and $\mathbb{C}ov(\varepsilon_i, \varepsilon_j)$. Consider three cases: (1) $i = j$, (2) $i = j+1$ (or $i = j-1$), and (3) $i > j+1$ (or $i < j-1$). Express $\mathbf{\Sigma} = \mathbb{C}ov(\boldsymbol{\varepsilon})$ as a function of $\sigma^2$ and $\delta$.

2.  Compute $\mathbb{V}ar(\mathbf{b} | \mathbf{X})$ where $\mathbf{b}$ is the OLS estimate of $\boldsymbol{\beta} = [\beta_1, \dots, \beta_K]'$.

3.  If we knew $\mathbf{\Sigma}$, what would be the best linear unbiased estimator of $\boldsymbol\beta$?

4.  Assuming that $\mathbf{X'X}/n$ and $\mathbf{X'\Sigma X}/n$ converge to positive definite matrices (when $n$ goes to infinity), explain how to obtain a consistent estimate of $\boldsymbol{\beta}$.
