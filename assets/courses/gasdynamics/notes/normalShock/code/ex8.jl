# This file was generated, do not modify it. # hide
begin
   plot(M₁->abs(T02byT01(M₁, γ[2])), M₁min2, M₁max2,
              yaxis=:log,
              xlabel="M₁",
              ylabel="T02byT01",
              label="γ = $(γ[2])",
              title="Total Temperature variation",
              titlefontsize=10)
end
savefig(joinpath(@OUTPUT, "ex7.svg")) # hide