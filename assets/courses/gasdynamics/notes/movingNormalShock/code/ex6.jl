# This file was generated, do not modify it. # hide
function ΔsbyR(p₂byp₁, γ)
		log( ( T₂byT₁(p₂byp₁, γ) )^( γ/(γ-1) ) / p₂byp₁ )
end
plot(p₂byp₁->ΔsbyR(p₂byp₁, γ[2]), 1, 100,
              xlabel="p₂/p₁",
              ylabel="Δs/R", 
              label="γ = $(γ[2])",
			  #ylims=(0,6),
              title="Entropy change as a function of pressure ratio",
              titlefontsize=10)
plot!(p₂byp₁->ΔsbyR(p₂byp₁, γ[3]), 1, 100,
	label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex6.svg")) # hide