---
id: "binary-classification-roc"
title: "Classification thresholds and ROC coordinates"
difficulty: "Standard"
type: "Calculation"
related: "binary-predictions"
source_exercise: 63
---

## Statement

For six observations, a fitted binary-choice model gives:

| Observation | 1 | 2 | 3 | 4 | 5 | 6 |
|:--|--:|--:|--:|--:|--:|--:|
| Outcome $y_i$ | 1 | 0 | 1 | 0 | 1 | 0 |
| Predicted probability $\hat p_i$ | 0.90 | 0.80 | 0.70 | 0.40 | 0.30 | 0.10 |

Classify an observation as positive when $\hat p_i\ge c$.

1. For $c=0.50$, compute the numbers of true positives, false positives, true negatives, and false negatives.
2. Compute the true-positive rate, false-positive rate, and accuracy.
3. Repeat the true-positive and false-positive rates for $c=0.25$.
4. Explain the trade-off created by lowering the threshold.
5. Explain how the two pairs of rates correspond to points on an ROC curve and why accuracy alone can be misleading when the outcome is rare.
