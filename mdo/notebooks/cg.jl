function plot_optim_trace(plt, res, label_string)
   niter = length(Optim.x_trace(res))
	path=ones(niter,2)
	tmp = Optim.x_trace(res)
   for i in 1:1:niter
		path[i,1] = tmp[i][1]
		path[i,2] = tmp[i][2]
   end
	plot!(plt, path[:,1], path[:,2], seriestype=:line, markershape=:circle, lw=2, markersize = 4, label = label_string)
end

function run_and_plot_method(f, x̄₀, niter, method, plt)
  if method=="GradientDescent"
   res = optimize(f, x̄₀, GradientDescent(),
                  Optim.Options(iterations=niter,
                                store_trace=true,
                                extended_trace=true);
                  autodiff = :forward)
 elseif method=="ConjugateGradient"
   res = optimize(f, x̄₀, ConjugateGradient(),
                  Optim.Options(iterations=niter,
                                store_trace=true,
                                extended_trace=true);
                  autodiff = :forward)
 end
 plot_optim_trace(plt, res, method)
end

using Optim, Plots
theme(:solarized_light)
pyplot()


# Elementary example of an Ellipse
niter = 50
x̄₀ = [2.0, 1.0]

f(x::Vector) = x'*[1 0; 0 40]*x

plt = plot([0.0], [0.0], seriestype=:scatter, label="Minima")
# Steepest Descent
run_and_plot_method(f, x̄₀, niter, "GradientDescent", plt)
#Conjugate Gradient
run_and_plot_method(f, x̄₀, niter, "ConjugateGradient", plt)


x₁ = 0:0.01:0.1; x₂ = 0:0.01:0.1
z = [f([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,z,levels=50, xlabel="x₁", ylabel="x₂", title="Rosenbrock Function", titlefontsize=10)

# Classic Example of Rosenbrock Function
niter = 10
x̄₀ = [3.0, 1.5]

plt = plot([1.0], [1.0], seriestype=:scatter, label="Minima")

f(x::Vector) = (1.0 - x[1])^2 + 100.0 * (x[1] - x[2]^2)^2

x₁ = -5:0.05:5; x₂ = -5:0.05:5
z = [f([xi; yi])  for xi in x₁, yi in x₂]
plt = contour!(x₁,x₂,z,levels=50, xlabel="x₁", ylabel="x₂", title="Rosenbrock Function", titlefontsize=10)

# Steepest Descent
xsd = ones(niter,2)
xsd[1,:] = x̄₀
res = optimize(f, x̄₀, method = GradientDescent(),
	iterations=niter, store_trace=true, extended_trace=true)
plot_optim_trace(plt, res, "Steepest Descent")

#Conjugate Gradient
xcg = ones(niter,2)
xcg[1,:] = x̄₀
res = optimize(f, x̄₀, method = ConjugateGradient(),
	iterations=niter, store_trace=true, extended_trace=true)
plot_optim_trace(plt, res, "Conjugate Gradient")
