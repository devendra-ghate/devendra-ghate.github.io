+++
title = "Line Search Methods"
published = "05 February 2021"
tags = ["mdo"]
description = "Introduction to line search methods for unconstrained optimisation problems."
reeval = true
+++

Consider the following unconstrained optimisation problem statement.

$$ \min_{\bx \in \Re^n} f(\bx) $$

where $f(\bx)$ is a sufficiently smooth nonlinear function. The most obvious way of calculating the minima to solve the set of nonlinear equations arising from the necessary condition of optimality.

$$\nabla f(\bx) = 0$$

This is only only possible if $f(\bx)$ is an explicit function of $\bx$.
When the explicit form of the objective function is not known, then necessary
conditions of optimality cannot be used to find the minima. This is the case for most of the engineering problems. Moreover, engineering 


#### Gradient Descent Algorithms

Any algorithm that guarantees that $f(\bar{x}^{(k+1)} < f(\bar{x}^{(k)}$ 





#### General Gradient Descent algorithm

1. Select an initial guess $\bar{x}^{(0)}$
2. Compute $\bar{c}^{(0)} = \nabla f( \bar{x}^{(0)} )$
3. Check the termination criteria



<!--```julia:quadForms-->


<!--```-->
<!--\output{quadForms}-->
