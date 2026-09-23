---
id: "clt-buffon-precision"
title: "Precision of Buffon's needle estimator"
difficulty: "Advanced"
type: "Analytical"
related: "TCL"
source_exercise: 64
---

## Statement

Return to Buffon's needle experiment in Example \@ref(exm:Buffon). Let $X_i$ equal one when needle $i$ crosses a groove and zero otherwise. In the version of the experiment considered there,
$$
\mathbb{E}(X_i)=p=\frac{1}{\pi}.
$$
After $n$ independent throws, estimate $\pi$ by
$$
\widehat\pi=\frac{1}{\overline X_n}.
$$

1. Use the CLT to obtain an approximate distribution for $\overline X_n$.
2. Apply a first-order approximation to obtain the approximate standard error of $\widehat\pi$.
3. Find the smallest integer $n$ for which the approximate 95% margin of error for $\widehat\pi$ is at most $0.01$. Use the true value of $\pi$ when planning the required sample size.
