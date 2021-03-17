### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 4322be78-7920-11eb-001a-b783f83a3310
begin
	using Optim, Plots, PlutoUI
	plotly()
	plot([1.0], [1.0], seriestype=:scatter, label="Minima")
	
	f(x::Vector) = (1.0 - x[1])^2 + 100.0 * (x[1] - x[2]^2)^2
	
	x₁ = -5:0.05:5; x₂ = -5:0.05:5
	z = [f([xi; yi])  for xi in x₁, yi in x₂]
	plt = contour!(x₁,x₂,z,levels=50,
				xlabel="x₁",
              	ylabel="x₂", 
              	title="Rosenbrock Function",
              	titlefontsize=10)
	

end

# ╔═╡ 107507ca-79b3-11eb-0ce8-b9236a3986c7
begin
	import Pkg;
	Pkg.add("PlutoUI")
	
end

# ╔═╡ 6c144c30-79df-11eb-0dc8-718acebc02ac
begin
	niter = 100
	x̄₀ = [3.0, 10.0]
	# Steepest Descent
	xsd = ones(niter,2)
	xsd[1,:] = x̄₀
	res = optimize(f, x̄₀, method = GradientDescent(),
		iterations=niter, store_trace=true, extended_trace=true)
	function plot_optim_trace(plt, res)
		path=ones(niter,2)
		tmp = Optim.x_trace(res)
		for i in 1:1:niter
			path[i,1] = tmp[i][1]
			path[i,2] = tmp[i][2]
	    end
		plot!(plt, path[:,1], path[:,2], seriestype=:scatter, label = "Steepest Descent")
	end
	plt1 = plot()
	plot_optim_trace(plt, res)
		
end

# ╔═╡ ae8a4634-79e5-11eb-151f-298401deaf4e
Optim.x_trace(res)

# ╔═╡ 221d3c54-79e0-11eb-382e-e110734ee41f
Optim.minimizer(res)

# ╔═╡ Cell order:
# ╟─107507ca-79b3-11eb-0ce8-b9236a3986c7
# ╠═4322be78-7920-11eb-001a-b783f83a3310
# ╠═6c144c30-79df-11eb-0dc8-718acebc02ac
# ╠═ae8a4634-79e5-11eb-151f-298401deaf4e
# ╠═221d3c54-79e0-11eb-382e-e110734ee41f
