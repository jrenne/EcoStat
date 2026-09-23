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

3. Let $z_i$ be the value of a weather index at date $i$. Interpret the condition $\mathbb{E}(\varepsilon_i\mid z_i)=0$. What additional condition must $z_i$ satisfy to be a valid instrument? Assuming validity, name the method that can be used to estimate $\beta$.

4. Let $\mathbf Z$ be the $n$-dimensional vector with $i$th element $z_i$. Regress $\Delta s_i$ on $z_i$ by OLS and express the fitted vector $\widehat{\Delta\mathbf s}$ as a function of $\mathbf Z$.

5. Show that the OLS regression of $y_i$ on the fitted values $\widehat{\Delta s_i}$ provides a consistent estimate of $\beta$.
