# This file was generated, do not modify it. # hide
function T02byT01(M₁, γ)
	T₂byT₁(M₁, γ)*( 1 + ((γ-1)*M₂(M₁,γ)^2)/2 )/( 1 + ((γ-1)*M₁^2)/2 )
end
g=1.4
M₁ = 4.914726387
a = 1 + ((g-1)*M₂(M₁,g)^2)/2
b = 1 + ((g-1)*M₁^2)/2
println( "Temperature ratio from first approach is ", T₂byT₁(M₁, g), "\n")
println(T₂byT₁(M₁, g)*a/b)