using Plots
pyplot()
using ForwardDiff
# f(x) = 2x[1] + 3x[2]
# f(x::Vector) = x[1]*x[2] + x[1] + 1
# f(x::Vector) = x[1]*x[1] + x[2]*x[2]
# f(x::Vector) = x[1]*x[1] + 4x[2]*x[2]
# f(x::Vector) = (x[1]-5)^2 + x[2]^2 + x[1]*x[2]*x[2]
f(x::Vector) = exp(-10*( (x[1]+0.3)^2 + (x[2]-0.3)^2 )) + exp(-1*( (x[1]+0.3)^2 + (x[2]+0.3)^2 ))
x₁ = -1:0.05:1; x₂ = -1:0.05:1
z = [f([xi; yi])  for xi in x₁, yi in x₂]
plt = contour(x₁,x₂,z,levels=50)

g = x->ForwardDiff.gradient(f,x)
h = x->ForwardDiff.hessian(f,x)

fq(x) = f(x₀) + g(x₀)'*x + x'*h(x₀)*x/2

x₀ = [-0.6; +0.3]
x₁ = range(x₀[1]-0.2,x₀[1]+0.2,length=100)
x₂ = range(x₀[2]-0.2,x₀[2]+0.2,length=100)
zq = [fq([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,zq)

x₀ = [-0.7; -0.3]
x₁ = range(x₀[1]-0.2,x₀[1]+0.2,length=100)
x₂ = range(x₀[2]-0.2,x₀[2]+0.2,length=100)
zq = [fq([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,zq)

x₀ = [-0.3; -0.3]
x₁ = range(x₀[1]-0.2,x₀[1]+0.2,length=100)
x₂ = range(x₀[2]-0.2,x₀[2]+0.2,length=100)
zq = [fq([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,zq)

x₀ = [0.1; -0.3]
x₁ = range(x₀[1]-0.2,x₀[1]+0.2,length=100)
x₂ = range(x₀[2]-0.2,x₀[2]+0.2,length=100)
zq = [fq([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,zq)

x₀ = [0.2; -0.3]
x₁ = range(x₀[1]-0.2,x₀[1]+0.2,length=100)
x₂ = range(x₀[2]-0.2,x₀[2]+0.2,length=100)
zq = [fq([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,zq)


plot!(x₀[1], x₀[2],markersize=6,markershape=:cross)
