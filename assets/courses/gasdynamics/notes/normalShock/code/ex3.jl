# This file was generated, do not modify it. # hide
function T₂byT₁(M₁, γ)
	(1 + (γ-1)/2*M₁^2)/(1 + (γ-1)/2*M₂(M₁,γ)^2)
	#1 + ( 2*(γ-1)/(γ+!)^2 )*( (γ*M₁^2 + 1)*(M₁^2-1)/M₁^2 )
end
plot(M₁->T₂byT₁(M₁, γ[2]), M₁min2, M₁max2,
 	      xlabel="M₁",
           ylabel="T₂byT₁", 
           label="γ = $(γ[2])",
           title="Static Temperature variation",
           titlefontsize=10)
plot!(M₁->T₂byT₁(M₁, γ[1]), M₁min2, M₁max2,
			label="γ = $(γ[1])")
savefig(joinpath(@OUTPUT, "ex3.svg")) # hide