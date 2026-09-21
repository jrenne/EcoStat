---
id: "panel-effects-true-false"
title: "Individual and time effects: true or false?"
difficulty: "Standard"
type: "True or false"
related: "Panel"
source_exercise: 38
---

## Statement
We consider the panel regression model:

$$y_{it} = \mathbf{x}_{it}'\boldsymbol{\beta} + \gamma_t + \alpha_i + \varepsilon_{it}$$

where:

-   $t \in \{1, \dots, T\}$ indexes the time period.

-   $i \in \{1, \dots, n\}$ indexes the individuals.

-   $\mathbf{x}_{it}$ is a vector of time-varying regressors for individual $i$ in period $t$.

-   $\boldsymbol{\beta}$ denotes the associated coefficients.

-   $\gamma_t \neq 0$ is a time-specific effect that has a non-zero correlation with $\mathbf{x}_{it}$.

-   $\alpha_i \neq 0$ is a time-constant unobserved individual effect that has a non-zero correlation with $\mathbf{x}_{it}$.

-   $\varepsilon_{it}$ is independent across $i$ and $t$, independent of all regressors and effects, and satisfies $\varepsilon_{it} \sim \mathcal{N}(0, 1)$.

For each statement, decide whether it is true or false and justify your answer.

1.  Random effects regression consistently estimates $\boldsymbol{\beta}$ when including both $\mathbf{x}_{it}$ and $\gamma_t$ in the regression model.

2.  In an infinitely large sample, the Hausman test rejects the hypothesis of equal coefficients across random and fixed effects regression when including both $\mathbf{x}_{it}$ and $\gamma_t$ in the regression models.

3.  Fixed effects regression consistently estimates $\boldsymbol{\beta}$ when omitting $\gamma_t$ in the regression model, while including $\mathbf{x}_{it}$ in the model.

4.  The time-varying error term $\varepsilon_{it}$ satisfies strict exogeneity.

5.  Random effects regression imposes weaker assumptions on the joint error term $\alpha_i + \varepsilon_{it}$ than fixed effects regression.
