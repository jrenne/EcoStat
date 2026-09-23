---
id: "panel-fixed-effects"
title: "Fixed effects in a panel model"
difficulty: "Advanced"
type: "Analytical"
related: "FixedEffect"
source_exercise: 37
---

## Statement
Consider the following panel regression model: $$y_{i,t} = \beta x_{i,t} + \alpha_i + \varepsilon_{i,t}, \quad i \in \{1, \dots, n\}, \quad t \in \{1, \dots, T\},$$ where $x_{i,t}$ and $\beta$ are scalars, where the $\varepsilon_{i,t}$'s are i.i.d. $\mathcal{N}(0, \sigma^2)$ and where $\mathbb{E}(\varepsilon_{i,t}|\mathbf{X}) = 0$, where $\mathbf{X} = [\mathbf{x}_1', \dots, \mathbf{x}_n']'$ with $\mathbf{x}_i = [x_{i,1}, \dots, x_{i,T}]'$ (i.e., $\mathbf{x}_i$ is of dimension $T \times 1$ and $\mathbf{X}$ is of dimension $(nT) \times 1$). The disturbances $\varepsilon_{i,t}$ and the explanatory variables $x_{i,t}$ are assumed to be independent across entities $i$ and across time $t$. However, in general, the $\alpha_i$s may be correlated to the $x_{i,t}$.

1.  What is called this type of model?

2. For this question only, assume that $\alpha_i=\alpha$. Explain how to estimate the model.

Return to the general case (where $\alpha_i$ may be different from $\alpha_j$ if $i \neq j$) and let us use the notation $\nu_{i,t} = \alpha_i - \alpha + \varepsilon_{i,t}$ where $\alpha$ is defined by $\alpha = \mathbb{E}(\alpha_i)$. In this case, the model can be written: $$y_{i,t} = \alpha + \beta x_{i,t} + \nu_{i,t}, \quad i \in \{1, \dots, n\}, t \in \{1, \dots, T\}.$$

3.  What can we say about $\mathbb{E}(\nu_{i,t}|x_{i,t})$?

4.  Explain how to get the best linear unbiased estimators (BLUE) of $\beta$ and $\boldsymbol{\alpha} = [\alpha_1, \dots, \alpha_n]'$. (Propose formulas based on matrices that you will specify).

5.  Give the covariance matrix of these BLUE estimators.

6.  Explain how one can use an $F$-test to test for the equality of the $\alpha_i$s.
