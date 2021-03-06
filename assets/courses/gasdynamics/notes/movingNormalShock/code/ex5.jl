# This file was generated, do not modify it. # hide
plot(p₂byp₁->T02byT01(p₂byp₁, γ[2]), 1, 100,
	              xlabel="p₂/p₁",
	              ylabel="T02/T01",
	              label="γ = $(γ[2])",
				  #ylims=(0,6),
	              title="Total temperature ratio as a function of pressure ratio",
	              titlefontsize=10)
plot!(p₂byp₁->T02byT01(p₂byp₁, γ[3]), 1, 100,
		label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex5.svg")) # hide