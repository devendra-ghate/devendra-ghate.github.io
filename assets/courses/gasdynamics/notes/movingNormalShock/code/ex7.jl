# This file was generated, do not modify it. # hide
plot(p₂byp₁->ΔsbyR(p₂byp₁, γ[2]), 1, 3,
	              xlabel="p₂/p₁",
	              ylabel="Δs/R", 
	              label="γ = $(γ[2])",
				  ann=[(1.25,0.01,"Nearly Isentropic region")],
	              title="Almost isentropic flow at low Mach numbers (Acoustic Theory)",
	              titlefontsize=10)
plot!(p₂byp₁->ΔsbyR(p₂byp₁, γ[3]), 1, 3,
		label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex7.svg")) # hide