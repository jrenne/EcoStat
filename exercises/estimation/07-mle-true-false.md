---
id: "estimation-mle-true-false"
title: "Maximum-likelihood theory: true or false?"
difficulty: "Standard"
type: "True or false"
related: "secMLE"
source_exercise: 45
---

## Statement
We consider a sample of variables $y_i$, $i \in \{1,\dots,n\}$, that are independently and identically distributed. The sample length $n$ is large. The distribution of the $y_i$'s depends on three parameters gathered in vector $\boldsymbol\theta=[\theta_1,\theta_2,\theta_3]'$. The likelihood function is given by $\mathcal{L}(\boldsymbol\theta;{\bf y})$, where ${\bf y}=[y_1,\dots,y_n]'$.

We denote by $\boldsymbol\theta_{MLE}=[\theta_{MLE,1},\theta_{MLE,2},\theta_{MLE,3}]'$ the maximum likelihood estimate of $\boldsymbol\theta$. We obtain $\boldsymbol\theta_{MLE} = [-2.90,0.82,0.60]'$. The opposite of the inverse of the Hessian matrix of the log-likelihood, evaluated at $\boldsymbol\theta_{MLE}$, is: $$-\left[\frac{\partial^2\log \mathcal{L}(\boldsymbol\theta_{MLE};{\bf y})}{\partial \boldsymbol\theta \partial \boldsymbol\theta'}\right]^{-1} =
\left[
\begin{array}{ccc}
1.00   &  0.30 & -0.40\\
0.30   & 2.00  & 0.20\\
-0.40  & 0.20  & 0.25
\end{array}
\right].$$

For each statement, decide whether it is true or false and justify your answer.

1. An estimate of $\theta_{MLE,2}$'s variance is 1.

2. An estimate of the variance of $\theta_{MLE,1}+\theta_{MLE,2}$ is 3.

3. $0$ is not included in the approximate 95% confidence interval of $\theta_1$.

4. We reject the null hypothesis $H_0:\;\theta_3=0$ at the 5% significance level.

5. The correlation between the estimates of $\theta_1$ and $\theta_3$ is negative.
