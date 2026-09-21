---
id: "time-series-forecasting"
title: "Two-step forecasting"
difficulty: "Advanced"
type: "Application"
related: "forecasting"
source_exercise: 51
---

## Statement
We denote: $\mathbb{E}_t(\cdot) = \mathbb{E}(\cdot | y_t, y_{t-1}, \dots)$ and $\mathbb{V}ar_t(\cdot) = \mathbb{V}ar(\cdot | y_t, y_{t-1}, \dots)$.

1.  Consider the processes introduced in the stationarity exercise. For the processes (a) and (b), compute $\mathbb{E}_t(y_{t+2})$ and $\mathbb{V}ar_t(y_{t+2})$.

2.  Using the fact that $\mathbb{P}(X < 2.58) = 0.995$ if $X \sim \mathcal{N}(0,1)$, compute a 99% prediction interval for $y_{t+2}$, conditional on $y_t,y_{t-1},\dots$, for processes (a) and (b) from the stationarity exercise.

3.  To what does $y_{t+h} - \mathbb{E}_t(y_{t+h})$ correspond? Give a name for this expression.

4.  Conditional on $y_t, y_{t-1}, \dots$, what is the expected value of $y_{t+h} - \mathbb{E}_t(y_{t+h})$?
