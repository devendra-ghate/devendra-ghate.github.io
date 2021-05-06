# This file was generated, do not modify it. # hide
function T₂byT₁(p₂byp₁, γ)
	( (γ+1)/(γ-1) + p₂byp₁ )/((γ+1)/(γ-1) + 1/p₂byp₁)
end
function T02byT01(p₂byp₁, γ)
	T₂byT₁(p₂byp₁, γ) + (γ-1)/2 * ( V₂bya₁(p₂byp₁, γ) )^2
end
plot(p₂byp₁->p02byp01(p₂byp₁, γ[2]), 1, 30,
              xlabel="p₂/p₁",
              ylabel="p02/p01", 
              label="γ = $(γ[2])",
			  #ylims=(0,6),
              title="Total pressure ratio as a function of pressure ratio",
              titlefontsize=10)
plot!(p₂byp₁->p02byp01(p₂byp₁, γ[3]), 1, 30,
	label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex4.svg")) # hide