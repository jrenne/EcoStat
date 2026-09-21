---
id: "panel-dynamic-panel"
title: "Endogeneity after first differencing"
difficulty: "Advanced"
type: "Analytical"
related: "DynPanel"
source_exercise: 59
---

## Statement

Consider
$$
y_{it}=\rho y_{i,t-1}+\alpha_i+\varepsilon_{it},
$$
where $\varepsilon_{it}$ has mean zero, variance $\sigma^2$, and is serially uncorrelated. Initial conditions are independent of future innovations.

1. First-difference the model to remove $\alpha_i$.
2. Show that $\Delta y_{i,t-1}$ is correlated with $\Delta\varepsilon_{it}$. In particular, compute $\mathbb{C}ov(\varepsilon_{i,t-1},\varepsilon_{it}-\varepsilon_{i,t-1})$.
3. Explain why OLS applied to the differenced equation is inconsistent when the number of entities grows and the number of periods is fixed.
4. Show why $y_{i,t-2}$ can be a valid instrument for $\Delta y_{i,t-1}$ under the stated assumptions. Distinguish instrument exogeneity from relevance.
5. What feature of the error process would invalidate this instrument?
