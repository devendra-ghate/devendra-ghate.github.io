# This file was generated, do not modify it. # hide
function ρ₂byρ₁(M₁, γ)
	p₂byp₁(M₁, γ)/T₂byT₁(M₁, γ)
end
plot(M₁->ρ₂byρ₁(M₁, γ[2]), M₁min2, M₁max2,
 	      xlabel="M₁",
           ylabel="ρ₂byρ₁", 
           label="γ = $(γ[2])",
           title="Density variation",
           titlefontsize=10)
plot!(M₁->ρ₂byρ₁(M₁, γ[1]), M₁min2, M₁max2,
	label="γ = $(γ[1])")
savefig(joinpath(@OUTPUT, "ex5.svg")) # hide