# This file was generated, do not modify it. # hide
plot(p₂byp₁->M₂(p₂byp₁, 1.4), 1, 100,
	              xlabel="p₂/p₁",
	              ylabel="M₂", 
	              label="γ = 1.4",
				  ylims=(0,2.5),
	              title="Induced Mach number before the shock as a function of the pressure ratio",
	              titlefontsize=10)
plot!(p₂byp₁->M₂(p₂byp₁, 1.67), 1, 100,
			label="γ = 1.67")
savefig(joinpath(@OUTPUT, "ex2.svg")) # hide