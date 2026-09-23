---
id: "time-series-yule-walker"
title: "Yule-Walker equations for an AR(2)"
difficulty: "Advanced"
type: "Proof"
related: "TS"
source_exercise: 50
---

## Statement
Consider the following process (assume it is stationary):

$$y_t = c + \phi_1 y_{t-1} + \phi_2 y_{t-2} + \varepsilon_t,$$

where $\varepsilon_t \sim i.i.d. \mathcal{N}(0, \sigma^2)$.

1.  Compute its unconditional mean $\mu$.

2.  What is the difference equation followed by $x_t = y_t - \mu$?

3.  Multiply both sides of the $x_t$'s difference equation by $x_t$ and deduce a relationship between the autocovariances $\gamma_0$, $\gamma_1$ and $\gamma_2$ of $y_t$.

4.  Multiply both sides of the $x_t$'s difference equation by $x_{t-1}$ and deduce a relationship between the autocovariances $\gamma_0$ and $\gamma_1$.

5.  Multiply both sides of the $x_t$'s difference equation by $x_{t-2}$ and deduce a relationship between the autocovariances $\gamma_0$, $\gamma_1$ and $\gamma_2$.

6.  From (c), (d), and (e) deduce a way to compute $\gamma_0$, $\gamma_1$ and $\gamma_2$.

7. Given $\gamma_0$, $\gamma_1$, and $\gamma_2$, explain how to compute $\gamma_3$.

8. Explain how to compute $\gamma_j$ for any $j>2$.
