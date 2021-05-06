# This file was generated, do not modify it. # hide
function p₂byp₁(M₁, γ)
	(1 + γ*M₁^2)/(1 + γ*M₂(M₁,γ)^2)
end
plot(M₁->p₂byp₁(M₁, γ[2]), M₁min2, M₁max2,
 	      xlabel="M₁",
           ylabel="p₂byp₁", 
           label="γ = $(γ[2])",
           title="Pressure variation",
           titlefontsize=10)
plot!(M₁->p₂byp₁(M₁, γ[1]), M₁min2, M₁max2,
	label="γ = $(γ[1])")
savefig(joinpath(@OUTPUT, "ex4.svg")) # hide