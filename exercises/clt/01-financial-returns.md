---
id: "clt-financial-returns"
title: "Financial returns and the CLT"
difficulty: "Advanced"
type: "Application"
related: "TCL"
source_exercise: 20
---

## Statement
Consider a financial asset whose value on day $i$ is $S_i$. We set $s_i = \log(S_i/S_{i-1})$ and we assume that $s_i = \mu + \sigma Z_i$, where the $Z_i$ are identically and independently distributed (i.i.d.) and are drawn from a Student distribution with $\nu$ degrees of freedom (i.e. $Z_i \sim \text{i.i.d.}\, t(\nu)$).\
An investor buys the asset at date $0$ and holds it until date $n$. We denote by $\bar{s}_n$ the average of $s_i$ between periods $0$ and $n$, that is $\bar{s}_n = \frac{1}{n} \sum_{i=1}^n s_i$.\
We recall that if $Z \sim t(\nu)$, then $\mathbb{E}(Z) = 0$ and $\mathbb{V}ar(Z) = \frac{\nu}{\nu - 2}$ for $\nu > 2$.

1. Interpret $s_i$.

2.  Express $S_n$ as a function of $\bar{s}_n$ and of $S_0$.

3.  Assuming that $n$ is large, give an approximation of the distribution of $\sqrt{n}\bar{s}_n$.

4.  Show that $\mathbb{P}(S_n < S_0) = \mathbb{P}(\sqrt{n}\bar{s}_n < 0)$.

5. For large $n$, derive an approximation to the probability that the investor loses money by holding the asset between dates 0 and $n$.
