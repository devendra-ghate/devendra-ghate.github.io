# This file was generated, do not modify it. # hide
using Markdown
using LaTeXStrings
function a₁(T₁,γ)
	R=287 # For air
	γ*R*T₁
end

function M₁(p₂byp₁, γ)
	( (γ+1)/2γ * p₂byp₁ + (γ-1)/2γ )^0.5
end

function wₛbya₁(p₂byp₁, γ)
	M₁(p₂byp₁, γ)
end

function wₛ(p₂byp₁, T₁, γ)
	a₁(T₁,γ)*M₁(p₂byp₁, γ)
end

function ρ₂byρ₁(p₂byp₁, γ)
	( (γ+1)/(γ-1)*p₂byp₁ + 1 )/( (γ+1)/(γ-1) +  p₂byp₁ )
end

function V₂(p₂byp₁, T₁, γ)
	wₛ(p₂byp₁, T₁, γ)*(1 - 1/ρ₂byρ₁(p₂byp₁, γ) )
end

function V₂bya₁(p₂byp₁, γ)
	M₁(p₂byp₁, γ)*(1 - 1/ρ₂byρ₁(p₂byp₁, γ) )
end

function M₂(p₂byp₁, γ)
	( ( (γ+1)/(γ-1) + 1/p₂byp₁ )/( (γ+1)/(γ-1) + p₂byp₁ ) )^0.5 * ( p₂byp₁*(γ+1)/2γ + (γ-1)/2γ )^0.5 * (1 - ( (γ+1)/(γ-1) + p₂byp₁ )/ ( (γ+1)/(γ-1)*p₂byp₁ + 1 ) )
end

γ = [1.2, 1.4, 1.67]

plot(p₂byp₁->wₛbya₁(p₂byp₁, γ[2]), 1, 100,
           xlabel="p₂/p₁",
           ylabel="wₛ/a₁", 
           label="γ = $(γ[2])",
           title="Mach number of shock as a function of pressure ratio",
           titlefontsize=10)
plot!(p₂byp₁->wₛbya₁(p₂byp₁, γ[3]), 1, 100,
	label="γ = $(γ[3])")
savefig(joinpath(@OUTPUT, "ex1.svg")) # hide