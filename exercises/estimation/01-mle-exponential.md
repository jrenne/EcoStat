---
id: "estimation-mle-exponential"
title: "Maximum likelihood for an exponential distribution"
difficulty: "Standard"
type: "Analytical"
related: "secMLE"
source_exercise: 39
---

## Statement
Exponential population: Let $X_1,\dots,X_n$ be i.i.d. with distribution $\mathcal{E}(\lambda)$, whose density is

$$f_X(x) = \frac{1}{\lambda} e^{-\frac{1}{\lambda}x},$$

with $\lambda > 0$ and $x>0$. Suppose the observed sample is $x_1,\dots,x_n$. Denote it by $\mathbf{x}=(x_1,\dots,x_n)'$.

1.  Construct the likelihood function $\mathcal{L}(\theta; \mathbf{X})$. What is $\theta$?

2.  Construct the log-likelihood function $\log \mathcal{L}(\theta; \mathbf{X})$.

3.  What is the maximum likelihood estimator of $\theta$?

4.  Compute the second derivative of the log-likelihood function $\log \mathcal{L}(\theta; \mathbf{X})$.

5.  Noting that $\mathbb{E}(X) = \lambda$, compute $\mathbf{I}(\theta_0) = \mathcal{I}_{x_1, \dots, x_n}(\theta_0)$.

6.  Find the asymptotic distribution of $\theta_{MLE}$.
