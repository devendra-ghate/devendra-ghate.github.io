# This file was generated, do not modify it. # hide
function p02byp01(p₂byp₁, γ)
	(1 + M₂(p₂byp₁, γ)^2 * (γ-1)/2)^(γ/(γ-1)) * p₂byp₁
end
plot(p₂byp₁->p02byp01(p₂byp₁, γ[2]), 1, 100,
              xlabel="p₂/p₁",
              ylabel="p02/p01", 
              label="γ = $(γ[2])",
              title="Total pressure ratio as a function of pressure ratio",
              titlefontsize=10)
plot!(p₂byp₁->p02byp01(p₂byp₁, γ[3]), 1, 100,
	label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex3.svg")) # hide