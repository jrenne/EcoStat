---
id: "binary-multinomial-choice"
title: "Ordered-probit model"
difficulty: "Advanced"
type: "Analytical"
related: "latent"
source_exercise: 46
---

## Statement
We consider a situation where a dependent variable $y_i$ can take $Z$ different values, that is $y_i \in \{1, \dots, Z\}$. We consider $n$ entities, i.e. $i \in \{1, \dots, n\}$. Each entity is characterized by a $K$-dimensional vector $\mathbf{x}_i$. If we take two distinct entities, say $i$ and $j$ ($i \neq j$), we have that $(\mathbf{x}_i, y_i)$ is independent from $(\mathbf{x}_j, y_j)$.

To avoid a redundant location parameter, assume that $\mathbf{x}_i$ does not contain a constant.

For each entity $i$, the probability that $y_i = k$ (with $k \in \{1, \dots, Z\}$) is a function of $\mathbf{x}_i$. Specifically, there exist functions $g_1, g_2, \dots, g_Z$ that are such that:

$$\mathbb{P}(y_i = k | \mathbf{x}_i) = g_k(\boldsymbol{\beta}' \mathbf{x}_i),$$

where $\boldsymbol{\beta}$ is a $K$-dimensional vector.

1.  Provide examples of situations where a variable of interest $y_i$ can take a finite number of values.

2.  Provide an example of a situation where the assumption according to which the $(\mathbf{x}_i, y_i)$ are independent across entities $i$ would not be satisfied.

3.  What is the relationship that should be satisfied by $g_1(x), g_2(x), \dots, g_Z(x)$?

Let us introduce a variable $y_i^*$ defined by:

$$y_i^* = \boldsymbol{\beta}'\mathbf{x}_i + \varepsilon_i,$$

where $\varepsilon_i \sim i.i.d. \mathcal{N}(0,1)$. Let us further introduce $\alpha_j$, for $j \in \{1, \dots, Z-1\}$, such that $\alpha_1 < \alpha_2 < \dots < \alpha_{Z-1}$. We also employ the notation $\alpha_0 = -\infty$ and $\alpha_Z = +\infty$. The observed outcome is linked to the latent variable by $y_i=k$ if and only if $\alpha_{k-1}<y_i^*\leq\alpha_k$.

4.  Using $\Phi$ (the c.d.f. of the standard normal distribution), express $\mathbb{P}(y_i^* \in ]\alpha_{k-1}, \alpha_k[ | \mathbf{x}_i)$, for $k \in \{1, \dots, Z\}$.

5.  Show that the $\psi_k$ functions defined, for $k \in \{1, \dots, Z\}$, by:

    $$\psi_k: \quad x \to \mathbb{P}(y_i^* \in ]\alpha_{k-1}, \alpha_k[ | \boldsymbol{\beta}' \mathbf{x}_i = x),$$

    satisfy the relationship obtained in question 3.

6.  Let us denote by $\boldsymbol{\theta}$ the vector of parameters defining the model, that is $\boldsymbol{\theta} = [\boldsymbol{\beta}', \alpha_1, \dots, \alpha_{Z-1}]'$. Using $\Phi$, express $f(y_i | \mathbf{x}_i; \boldsymbol{\theta})$, the distribution of $y_i$ conditional on $\mathbf{x}_i$. Deduce the expression of the log-likelihood $\log \mathcal{L}(\boldsymbol{\theta}; \mathbf{y})$ associated with $\mathbf{y} = \{y_1, \dots, y_n\}$ (conditional on $\mathbf{x} = \{\mathbf{x}_1, \dots, \mathbf{x}_n\}$).

7.  Explain how one could obtain estimates of $\boldsymbol{\theta}$ (denoted by $\hat{\boldsymbol{\theta}}$) and how one could estimate the standard deviations associated with $\hat{\boldsymbol{\theta}}$.

Suppose that one has estimated two versions of such a model. In the first version (Model 1), vectors $\mathbf{x}_i$ are of dimension 3; in the second model (Model 2), two potential explanatory variables are added, in such a way that the $\mathbf{x}_i$ are of dimension 5. While the maximum log-likelihood associated with Model 1 is $\max \log \mathcal{L}_1 = -518.3$, the one associated with Model 2 is $\max \log \mathcal{L}_2 = -517.1$.

8.  Explain why it is not possible to have $\max \log \mathcal{L}_2 < \max \log \mathcal{L}_1$.

9.  Using a $\chi^2$ distribution table, what can you say about these two additional explanatory variables?
