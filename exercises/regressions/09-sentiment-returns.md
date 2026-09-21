---
id: "regressions-sentiment-returns"
title: "Consumer sentiment and stock returns"
difficulty: "Advanced"
type: "Application"
related: "CommonPitfalls"
source_exercise: 35
---

## Statement
We want to study the influence of consumer sentiment on stock returns ($y_i$). Some institutions construct (aggregated) consumer sentiment indices. These indices are usually based on surveys. We denote by $\Delta s_i$ the change in the value of such an index between date $i - 1$ and date $i$.

We have a sample of $n$ dates and we assume that the observations $(y_i, \Delta s_i)$ are independent across time (in other words they are \"serially independent\").

1.  Consider the model: $$        y_i = \beta \Delta s_i + \varepsilon_i,$$ with $\mathbb{E}(\varepsilon_i) = 0$.

    We also assume that: $$\varepsilon_i = \eta_i + \nu_i$$ $$\Delta s_i = \delta \eta_i + \zeta_i$$ where $\eta_i$, $\nu_i$ and $\zeta_i$ are zero-mean variables that are mutually and serially independent and with respective variances $\sigma_\eta^2$, $\sigma_\nu^2$ and $\sigma_\zeta^2$.

    Provide potential interpretations of $\eta_i$ and compute $\mathbb{E}(\varepsilon_i \Delta s_i)$.

2.  What can be said about the OLS estimate of $\beta$ (the model above)?

3.  Let us denote by $z_i$ the value a weather index at date $i$. We assume that $\mathbb{E}(\varepsilon_i | z_i) = 0$; how to interpret this? What are the other conditions that $z_i$ should satisfy so as to constitute a valid instrument? In the following, we assume that $z_i$ constitutes a valid instrument. What approach can then be resorted to to estimate $\beta$ (gives the name of the approach only)?

4.  Let us denote by $\mathbf{Z}$ the $n$-dimensional vector whose $i^{th}$ element is $z_i$. We regress $\Delta s_i$ on $z_i$ by OLS. Express the fitted value of $\Delta s_i$ as a function of $\mathbf{Z}$. We denote by $\widehat{\Delta s_i}$ these fitted values.

5.  Show that the OLS regression of $y_i$ on $\widehat{\Delta s_i}$ provides a consistent estimate of $\beta$.
