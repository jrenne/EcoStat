---
id: "time-series-ar2-true-false"
title: "AR(2) forecasts and variances: true or false?"
difficulty: "Advanced"
type: "True or false"
related: "forecasting"
source_exercise: 52
---

## Statement
We consider an AR(2) process defined by $$y_t = \phi_1 y_{t-1} + \phi_2 y_{t-2} + \varepsilon_t,$$ where $\varepsilon_t \sim i.i.d.\,\mathcal{N}(0,\sigma^2)$.

The parameters $\phi_1$ and $\phi_2$ are nonzero and such that the process is covariance-stationary.

Using standard notations, we denote by $\mathbb{E}_t$ and $\mathbb{V}ar_t$ the expectation and variance conditional on the information set $\{y_t,y_{t-1},\dots\}$. For instance, $$\mathbb{E}_t(\cdot)=\mathbb{E}(\cdot|y_t,y_{t-1},\dots).$$

For each statement, decide whether it is true or false and justify your answer.

1. $\mathbb{V}ar(y_t)>\mathbb{V}ar(y_{t-2})$.

2. $\mathbb{V}ar_t(y_{t+2}) = \sigma^2$.

3. $\mathbb{E}_t(y_{t+1}) = \phi_1 y_t + \phi_2 y_{t-1}$.

4. $\mathbb{E}(y_t)=0$.

5. The two solutions to the equation $\lambda^2-\phi_1\lambda-\phi_2=0$, denoted $\lambda_1$ and $\lambda_2$, satisfy $\lambda_1>1$ and $\lambda_2>1$.
