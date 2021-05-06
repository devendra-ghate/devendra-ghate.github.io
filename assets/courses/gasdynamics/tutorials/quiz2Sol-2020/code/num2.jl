# This file was generated, do not modify it. # hide
M₁ = 2; θ₁ = 6 # Given
β₁ = 35.24 # From oblique shock tables
M₁n = M₁*sind(β₁)
M₂n = 0.72*0.8820 + 0.25*0.8682 # Linear extrapolation from normal shock table
M₂ = M₂n/sind(β₁ - θ₁)
println("M₂ is $(M₂)") # hide