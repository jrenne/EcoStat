---
id: "binary-marginal-effects"
title: "Marginal effects in a probit model"
difficulty: "Standard"
type: "Calculation"
related: "marginalFX"
source_exercise: 62
---

## Statement

Consider
$$
\mathbb{P}(Y_i=1\mid x_i)=\Phi(\theta_0+\theta_1x_i),
$$
where $x_i$ is continuous and $\Phi$ and $\phi$ are the standard-normal c.d.f. and p.d.f.

1. Derive the marginal effect of $x_i$ on the success probability.
2. Evaluate it at $x_i=2$ when $\theta_0=-1$ and $\theta_1=0.5$.
3. Does $\theta_1=0.5$ mean that increasing $x_i$ by one unit always raises the probability by 0.5? Explain.
4. Compare the marginal effect at the mean with the average marginal effect.
5. If $x_i$ were binary, what quantity should replace the derivative?
