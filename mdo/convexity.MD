<!--+++-->
<!--title = "Convexity"-->
<!--description = "What? Why? How?"-->
<!--+++-->

# Convexity

The term “convex” can be applied both to sets and to functions.

- A set $S \in \R^n$ is a convex set if the straight line segment connecting any two points in $S$ lies entirely inside $S$.
Formally, for any two points $x ∈ S$ and $y ∈ S$, we have

$$\alpha x + (1 − α)y ∈ S \forall α ∈ [0, 1].$$

- The function $f$ is a convex function if its domain $S$ is a convex set and if for any two points
$x,y \in S$, the following property is satisfied:

$$f (αx + (1 − α)y) ≤ α f (x) + (1 − α) f (y),\ \forall α ∈ [0, 1].$$

Examples of convex sets include

1. unit ball $y ∈ IR n | y 2 ≤ 1$
2. All linear programming problems
