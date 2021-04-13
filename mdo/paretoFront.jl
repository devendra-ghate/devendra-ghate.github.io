using JuMP
using Ipopt
using PyPlot

obj1(x,y) = x
obj2(x,y) = 1 .+ y.^2 .- x .- a.*sin.(b.*π.*x)
obj_ws(x,y) = w.*x + (1 .- w).*(1 .+ y.^2 .- x .- a.*sin(b.*π.*x))

# Plotting pareto front

# Convex pareto front
#=a = 0.2; b = 1.0=#
# Concave pareto front
a = 0.1; b = 2.5
x₂=-2.0:0.05:2.0
for x₁=0.0:0.05:1.0
    tmp = minimum(obj2(x₁, x₂))
    plot(x₁,tmp,"sk")
end

m = Model(Ipopt.Optimizer)

# Global design variables
@variable(m, x₁, start = 0.5)
@variable(m, x₂, start = 0.5)

# Parameter
@NLparameter(m, w == 0.0)

JuMP.register(m, :obj_ws, 2, obj_ws, autodiff=true)
# Box constraints
@constraint(m,  0 <= x₁ <= 1)
@constraint(m, -2 <= x₂ <= 2)

for i in 0.0:0.1:1.0
  println(i)
end
for i in 0.0:0.1:1.0
    @NLobjective(m, Min, w*x₁ + (1-w)*(1 + x₂^2 - x₁ - a*sin(b*π*x₁)))
    set_value(w,i)
    optimize!(m)
    x₁_sol = getvalue(x₁)
    x₂_sol = getvalue(x₂)
    plot(obj1(x₁_sol,x₂_sol), obj2(x₁_sol, x₂_sol),"o")
end
xlabel("f₁"); ylabel("f₂"); title("Pareto Front using weighted sum method"); grid()

@NLobjective(m, Min, 1 + x₂^2 - x₁ - a*sin(b*π*x₁))
@constraint(m,  0 <= x₁ <= 0.4)
optimize!(m)
x₁_sol = getvalue(x₁)
x₂_sol = getvalue(x₂)
plot(obj1(x₁_sol,x₂_sol), obj2(x₁_sol, x₂_sol),"*")
xlabel("f₁"); ylabel("f₂"); title("Pareto Front using ϵ Constraint method"); grid()

# vim:filetype=julia:foldmethod=syntax
