using JuMP
using Ipopt
using Plots
pyplot()

o1(x,y) = x
o2(x,y) = 1 + y^2 - x - a*sin(b*π*x)
obj_ws(x,y) = w.*x + (1 .- w).*(1 .+ y.^2 .- x .- a.*sin(b.*π.*x))

# Plotting pareto front

x₂=-2.0:0.05:2.0
p6=Plots.plot()
for x₁=0.0:0.05:1.0
    tmp = minimum(obj2(x₁, x₂))
    Plots.plot!(p6,[x₁],[tmp],seriestype=:scatter, markershape=:circle, seriescolor=:black,label="")
end

global m = Model(Ipopt.Optimizer)

# Global design variables
@variable(m, x₁, start = 0.5)
@variable(m, x₂, start = 0.5)

# Parameter
@NLparameter(m, w == 0.0)
# Convex pareto front
#=a = 0.2; b = 1.0=#
# Concave pareto front
global a = 0.1
global b = 2.5
# @NLparameter(m, a == 0.1)
# @NLparameter(m, b == 2.5)

# JuMP.register(m, :obj_ws, 2, obj_ws, autodiff=true)
# Box constraints
@constraint(m,  0 <= x₁ <= 1)
@constraint(m, -2 <= x₂ <= 2)
@NLexpressions(m, begin
                 obj1, x₁
                 obj2, 1 + x₂^2 - x₁ - a*sin(b*π*x₁)
               end)
@NLobjective(m, Min, w*obj1 + (1-w)*obj2)

for i in 0.0:0.1:1.0
  println(i)
end
Plots.plot!(p6, xlabel="f₁", ylabel="f₂", title="Pareto Front using weighted sum method")
for i in 0.0:0.1:1.0
    set_value(w,i)
    optimize!(m)
    x₁_sol = getvalue(x₁)
    x₂_sol = getvalue(x₂)
    Plots.plot!(p6, [o1(x₁_sol,x₂_sol)], [o2(x₁_sol, x₂_sol)], seriestype=:scatter, markershape=:diamond, label="") #hide
#    plot!(obj1(x₁_sol,x₂_sol), obj2(x₁_sol, x₂_sol),"o")
end
savefig("epsConstraint.svg") # hide

@NLobjective(m, Min, 1 + x₂^2 - x₁ - a*sin(b*π*x₁))
@constraint(m,  0 <= x₁ <= 0.4)
optimize!(m)
x₁_sol = getvalue(x₁)
x₂_sol = getvalue(x₂)
plot(obj1(x₁_sol,x₂_sol), obj2(x₁_sol, x₂_sol),"*")
xlabel("f₁"); ylabel("f₂"); title("Pareto Front using ϵ Constraint method"); grid()
savefig(joinpath(@OUTPUT, "epsConstraint.svg")) # hide
