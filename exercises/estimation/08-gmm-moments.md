---
id: "estimation-gmm-moments"
title: "Exactly identified and overidentified moments"
difficulty: "Standard"
type: "Analytical"
related: "secGMM"
source_exercise: 60
---

## Statement

Let $Y_1,\dots,Y_n$ be i.i.d. with mean $\mu$, variance $v>0$, and finite fourth moment. Let $\boldsymbol\theta=(\mu,v)'$.

1. Construct two moment conditions based on the mean and variance.
2. Show that the exactly identified GMM estimator solves these sample moments and obtain explicit formulas for $\hat\mu$ and $\hat v$.
3. Does the weighting matrix affect this exactly identified estimator? Explain.
4. Suppose the distribution is also assumed symmetric, so that $\mathbb{E}[(Y_i-\mu)^3]=0$. Explain why the model is now overidentified.
5. How many degrees of freedom does the corresponding overidentification test have, and what does rejection mean?
