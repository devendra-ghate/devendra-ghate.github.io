# This file was generated, do not modify it. # hide
M₁ = 3.3; θ₁ = 25  # Given
β₁ = (40.57 + 43.22)/2 # From oblique shock tables
M₁n = M₁*sind(β₁)
M₂n = 0.5471; p₂byp₁ = 5.48; T₂byT₁ = 1.8569 # From normal shock table
M₂ = M₂n/sind(β₁ - θ₁)
θ₂ = θ₁ - 5
β₂ = 59.21 # From oblique shock tables
M₂n2 = M₂*sind(β₂)
M₃n = 1; p₃byp₂ = 1; T₃byT₂ = 1; # From normal shock table
δ = β₂ - 5 - 20
println("M₁n is $(M₁n)") # hide
println("M₂n2 is $(M₂n2)"); # hide
println("M₃n is $(M₃n)"); # hide
println("M₂ is $(M₂)") # hide
println("θ₂ is $(θ₂)") # hide
println("δ is $(δ)") # hide