# This file was generated, do not modify it. # hide
using JuMP
using Ipopt
using Plots

obj1(x,y) = x
obj2(x,y) = 1 .+ y.^2 .- x .- a.*sin.(b.*π.*x)
obj_ws(x,y) = w.*x + (1 .- w).*(1 .+ y.^2 .- x .- a.*sin(b.*π.*x))

# Plotting pareto front

# Convex pareto front
#=a = 0.2; b = 1.0=#
# Concave pareto front
a = 0.1; b = 2.5
x₂=-2.0:0.05:2.0
p7=Plots.plot(seriestype=:scatter)
for x₁=0.0:0.05:1.0
    tmp = minimum(obj2(x₁, x₂))
    println(x₁, tmp)
end

    #Plots.plot!(p7,[x₁],[tmp])
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
p6 = Plots.plot(xlabel="f₁", ylabel="f₂", title="Pareto Front using weighted sum method")
for i in 0.0:0.1:1.0
    @NLobjective(m, Min, w*x₁ + (1-w)*(1 + x₂^2 - x₁ - a*sin(b*π*x₁)))
    set_value(w,i)
    optimize!(m)
    x₁_sol = getvalue(x₁)
    x₂_sol = getvalue(x₂)
    Plots.plot!(p6, [obj1(x₁_sol,x₂_sol)], [obj2(x₁_sol, x₂_sol)], seriestype=:scatter, markershape=:circle) #hide
#    plot!(obj1(x₁_sol,x₂_sol), obj2(x₁_sol, x₂_sol),"o")
end
grid()

@NLobjective(m, Min, 1 + x₂^2 - x₁ - a*sin(b*π*x₁))
@constraint(m,  0 <= x₁ <= 0.4)
optimize!(m)
x₁_sol = getvalue(x₁)
x₂_sol = getvalue(x₂)
plot(obj1(x₁_sol,x₂_sol), obj2(x₁_sol, x₂_sol),"*")
xlabel("f₁"); ylabel("f₂"); title("Pareto Front using ϵ Constraint method"); grid()
savefig(joinpath(@OUTPUT, "epsConstraint.svg")) # hide