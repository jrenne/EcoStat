---
id: "binary-probit-models-true-false"
title: "Comparing probit specifications: true or false?"
difficulty: "Standard"
type: "True or false"
related: "marginalFX"
source_exercise: 47
---

## Statement
A binary choice model is estimated. There are $n$ observations of the dependent binary variable $y_i$ (i.e., each $y_i$ is either 0 or 1). For each entity $i$, there are 6 explanatory variables: $\mathbf{x}_i = [x_{i,1}, \dots, x_{i,6}]'$, with $x_{i,1} = 1$ (thus using a constant). The model is:

$$\mathbb{P}(y_i = 1 | \mathbf{x}_i; \boldsymbol{\theta}) = \Phi(\boldsymbol{\theta}'\mathbf{x}_i)$$

where $\Phi$ is the cumulative distribution function (CDF) of $\mathcal{N}(0, 1)$. We have $\boldsymbol{\theta} = [\theta_1, \dots, \theta_6]'$.

Three versions of the model are considered, all estimated by maximum likelihood:

-   **Version A:** Includes all 6 explanatory variables. The maximum log-likelihood value obtained is $-120$.

-   **Version B:** Removes 3 explanatory variables by imposing $\theta_4 = \theta_5 = \theta_6 = 0$. The maximum log-likelihood value obtained is $-125$.

-   **Version C:** Uses only a constant. This is equivalent to imposing $\theta_2 = \theta_3 = \theta_4 = \theta_5 = \theta_6 = 0$. The maximum log-likelihood value obtained is $-160$.

For each statement, decide whether it is true or false and justify your answer.

1.  In this model, we have $\mathbb{P}(y_i = 1 | \mathbf{x}_i; \boldsymbol{\theta}) = \mathbb{P}(y_i^* > 0 | \mathbf{x}_i; \boldsymbol{\theta})$, where $y_i^* = \boldsymbol{\theta}'\mathbf{x}_i + \varepsilon_i$, with $\varepsilon_i \sim \mathcal{N}(0, 1)$.

2.  The McFadden pseudo-$R^2$ associated with model A is 40%.

3.  A likelihood ratio test (LR test) is used to test the restrictions when moving from model A to model B. The test leads to rejecting the restricted model (model B) at the 1% level (i.e., for a test size of 1%).

4.  The McFadden pseudo-$R^2$ associated with model B is greater than that associated with model A.

5.  If $\theta_2 > 0$, then an increase in $x_{i,2}$ by one unit (all else equal) implies an increase in $\mathbb{P}(y_i = 1 | \mathbf{x}_i; \boldsymbol{\theta})$.
