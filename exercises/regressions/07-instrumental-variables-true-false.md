---
id: "regressions-instrumental-variables-true-false"
title: "Endogeneity and instruments: true or false?"
difficulty: "Advanced"
type: "True or false"
related: "IV"
source_exercise: 33
---

## Statement
Consider four random variables $v_i$, $w_i$, $z_i$, and $\varepsilon_i$. Each of them is Gaussian with mean zero.

An additional random variable $y_i$ is defined by $$y_i=\beta_1 v_i+\beta_2 w_i+\varepsilon_i.$$

The error term $\varepsilon_i$ is uncorrelated with $v_i$ and $z_i$, but it is correlated with $w_i$. Moreover, $w_i$ is correlated with $z_i$ but not with $v_i$. This implies in particular that $\mathbb{E}(\varepsilon_i|v_i)=0$, $\mathbb{E}(\varepsilon_i|v_i,w_i)\neq 0$, $\mathbb{E}(\varepsilon_i|w_i)\neq 0$, $\mathbb{E}(\varepsilon_i|v_i,z_i)=0$, $\mathbb{E}(w_i|v_i)=0$, and $\mathbb{E}(v_i|w_i)=0$.

None of the four random variables can be obtained as an exact linear combination of the other three. Finally, the variables $(v_i,w_i,z_i,\varepsilon_i)$ are independent across entities $i$.

We denote by $\hat{w}_i$ the fitted value of $w_i$ in the first-stage OLS regression of $w_i$ on both exogenous variables, $v_i$ and $z_i$.

For each statement, decide whether it is true or false and justify your answer.

1. In the OLS regression of $y_i$ on $(v_i,w_i)$, the OLS estimator of $\boldsymbol\beta=(\beta_1,\beta_2)'$ is unbiased.

2. $z_i$ is a valid instrument for $w_i$.

3. In the OLS regression of $y_i$ on $v_i$ (alone), the OLS estimator of $\beta_1$ is unbiased.

4. In the OLS regression of $y_i$ on $w_i$ (alone), the OLS estimator of $\beta_2$ is unbiased.

5. Regressing $y_i$ on $(v_i,\hat{w}_i)$ by OLS provides a consistent estimate of $(\beta_1,\beta_2)'$.
