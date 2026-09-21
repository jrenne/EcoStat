---
id: "panel-difference-in-differences"
title: "Difference-in-differences from group means"
difficulty: "Standard"
type: "Calculation"
related: "Panel"
source_exercise: 58
---

## Statement

A policy is introduced between two periods for a treated group but not for a control group. The sample means of the outcome are:

| Group | Before | After |
|:--|--:|--:|
| Control | 10 | 12 |
| Treated | 11 | 16 |

1. Compute the before--after change for each group.
2. Compute the difference-in-differences estimate.
3. State the parallel-trends assumption in this setting and explain its role.
4. Consider the regression
$$
y_{it}=\alpha+\delta\,\mathrm{Treated}_i+\tau\,\mathrm{After}_t
+\beta(\mathrm{Treated}_i\times\mathrm{After}_t)+u_{it}.
$$
Which coefficient equals the difference-in-differences estimate?
5. Give one example of a change occurring between the periods that would violate the identifying assumption.
