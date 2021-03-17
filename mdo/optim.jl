using Optim

# Objective function
f(x) = (x[1] - 1)^2/(a*a) + (x[2]-2)^2/(b*b) - 1

# Gradient of objective function
df(x) = [2*(x[1] - 1)/(a*a), 2*(x[2]-2)/(b*b)]

# Exact step-size calculation


xₖ = [1 1]
while norm(df(xₖ)) ≥ 10^-3
   ̄cₖ = df(xₖ)
   αₖ = 
   Δx = 


optimize(f, [0.0, 0.0], NelderMead())
