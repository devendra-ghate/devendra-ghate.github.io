# This file was generated, do not modify it. # hide
function p02byp01(M₁, γ)
	exp(-ΔsbyR(M₁, γ))
end
plot(M₁->p02byp01(M₁, γ[2]), M₁min2, M₁max2,
		  yaxis=:log,
	      xlabel="M₁",
           ylabel="p02byp01",
           label="γ = $(γ[2])",
           title="Total Pressure variation",
           titlefontsize=10)
plot!(M₁->p02byp01(M₁, γ[1]), M₁min2, M₁max2,
		  yaxis=:log,
		  label="γ = $(γ[1])")
savefig(joinpath(@OUTPUT, "ex6.svg")) # hide