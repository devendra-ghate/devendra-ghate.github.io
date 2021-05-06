# This file was generated, do not modify it. # hide
using LaTeXStrings

function θmax( β, γ=1.4 )
  atand( 2cosd(β)*sind(β)/(γ + cosd(2β)) )
end

γ = [1.2, 1.4, 1.67]
plot(β -> θmax(β,γ[1]), 0, 90, 
     label="",
     xlabel=L"\beta",
     ylabel=L"\theta_{max}")
savefig(joinpath(@OUTPUT, "maxtheta.svg")) # hide