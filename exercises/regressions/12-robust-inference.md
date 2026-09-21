---
id: "regressions-robust-inference"
title: "The covariance estimator changes inference"
difficulty: "Standard"
type: "Application"
related: "Clusters"
source_exercise: 56
---

## Statement

An OLS regression gives $b_2=0.80$. Three estimated standard errors are available:

| Covariance estimator | Standard error of $b_2$ |
|:--|--:|
| Homoskedastic | 0.25 |
| Heteroskedasticity-robust | 0.40 |
| Cluster-robust | 0.55 |

1. Explain why the coefficient estimate is the same in all three rows.
2. For each standard error, test $H_0:\beta_2=0$ against $H_1:\beta_2\ne0$ at the 5% significance level using the large-sample critical value 1.96.
3. Which covariance estimator should be preferred if observations may be dependent within firms but firms are independent of one another? State the additional sampling requirement needed for its large-sample justification.
4. Explain why choosing a covariance estimator after comparing which one gives significance is invalid practice.
