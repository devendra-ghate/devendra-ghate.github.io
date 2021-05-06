# This file was generated, do not modify it. # hide
function M₂(M₁, γ)
	sqrt( (1 + (γ-1)/2*M₁^2)/(γ*M₁^2 - (γ-1)/2) )
end
M₁min2 = 1; M₁max2 = 10
plot(M₁->M₂(M₁, γ[1]), M₁min2, M₁max2,
 	      xlabel="M₁",
           ylabel="M₂", 
           label="γ = $(γ[1])",
           title="Mach change across a shock",
	      #annotate = (5,0.5,text("γ ")),
           titlefontsize=10)
plot!(M₁->M₂(M₁, γ[2]), M₁min2, M₁max2,
			label="γ = $(γ[2])")
plot!(M₁->M₂(M₁, γ[3]), M₁min2, M₁max2,
			label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex2.svg")) # hide