# This file was generated, do not modify it. # hide
using Plots
using LaTeXStrings
begin
	γ = [1.66, 1.4, 1.2]
end
function ΔsbyR(M₁, γ)
	γ/(γ-1)*log( 1 + (2*( (γ-1)/(γ+1)^2 ) )*( (γ*M₁^2 + 1)/M₁^2 )*( M₁^2 -1 ) ) - log( 1 + 2γ/(γ+1)*(M₁^2 -1) )
end
M₁min1 = 0.4; M₁max1 = 5
plot(M₁->ΔsbyR(M₁, γ[1]), M₁min1, M₁max1,
           xlabel="M₁",
           ylabel="ΔsbyR",
           label="γ = $(γ[1])",
           title="Entropy change across a shock",
           titlefontsize=10)
plot!(M₁->ΔsbyR(M₁, γ[2]), M₁min1, M₁max1,
			label="γ = $(γ[2])")
plot!(M₁->ΔsbyR(M₁, γ[3]), M₁min1, M₁max1,
			label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex1.svg")) # hide