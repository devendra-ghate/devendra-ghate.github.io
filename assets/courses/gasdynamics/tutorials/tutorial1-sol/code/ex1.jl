# This file was generated, do not modify it. # hide
# Constants
γ = 1.4
Rᵤ = 8.3145 #Universal gas constant J/mole-K 

# Input
Mₒ = 32*10^-3 # molar mass of Oxygen in kg
T₁ = 25 + 273 # K
T₂ = 125 + 273 # K

# Calculations
R = Rᵤ/Mₒ #Mass specific gas constant for Oxygen J/kg-K 
cₚ = γ*R/(γ-1) #J/kg-K
cᵥ = cₚ - R  #J/kg-K
Δe = cᵥ*(T₂ - T₁)
Δh = cₚ*(T₂ - T₁)