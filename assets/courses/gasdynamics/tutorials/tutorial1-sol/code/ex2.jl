# This file was generated, do not modify it. # hide
# Constants
γ = 1.4
Rᵤ = 8.3145 #Universal gas constant J/mole-K

# Input
M = 28.97*10^-3 # molar mass of air in kg
p₁ = 101*1000 # Pascal (N/m^2)
p₂ = 1100*1000 # Pascal
T₁ = 310 # K

# Calculations
R = Rᵤ/M # J/kg-K
cₚ = γ*R/(γ-1) # J/kg-K
cᵥ = cₚ - R # J/kg-K
v₁ = p₁/R/T₁ # m/s
v₂ = (p₁/p₂)^(1/1.32) * v₁ # m/s
Δs = cᵥ*log(p₂/p₁) - cₚ*log(v₁/v₂) # J/kg-K