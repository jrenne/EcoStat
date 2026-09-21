---
id: "regressions-measurement-error"
title: "Measurement error in income"
difficulty: "Advanced"
type: "Application"
related: "CommonPitfalls"
source_exercise: 34
---

## Statement
We denote by $c_i$ the logarithm of consumption by household $i$ and by $y_i^*$ the permanent income of the same household.\
We consider a simple consumption function, of the form $$c_i = \beta y_i^* + \varepsilon_i, \quad \varepsilon_i \sim \mathcal{N}(0, \sigma^2),$$ where $\mathbb{E}(\varepsilon_i | y_i^*) = 0.$\
Permanent income $y_i^*$ is not observed but we have data on $y_i$, the current income of household $i$. Assume that $y_i = y_i^* + v_i$, where $v_i \sim \mathcal{N}(0, w^2)$, $\mathbb{E}(v_i | y_i^*) = 0$ and $\mathbb{E}(v_i | \varepsilon_i) = 0$.\
We have a sample of size $n$ and use the notation: $\mathbf{y} = [y_1, \dots, y_n]' \quad \text{and} \quad \mathbf{u} = [u_1, \dots, u_n]'$. We assume further that the $(y_i^*, \varepsilon_i, v_i)$ are independent (across $i$).\
We consider the linear regression of $c_i$ on $y_i$: $c_i = \beta y_i + u_i$. The residuals of this regression are denoted by $u_i$.

1.  Show that $u_i = \varepsilon_i - \beta v_i$.

2.  Compute the covariance between $y_i$ and $u_i$.

3.  We denote by $\mathbf{b}$ the OLS estimator of $\beta$ in the regression of $c_i$ on $y_i$ (with no constant term). After having expressed $\mathbf{b}$ as a function of $\beta$, $\mathbf{y}$ and $\mathbf{u}$, give the limit of $\mathbf{b}$ when $n \to \infty$ (the formula involves, in particular, $\mathbb{E}(y_i)$ and $\mathbb{V}ar(y_i)$).
