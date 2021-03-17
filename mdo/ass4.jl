# Data Generation

#hideall
y = zeros(11*11,1)
x1 = zeros(11*11,1)
x2 = zeros(11*11,1)
perturbation = 0.01.*(2 .* rand(Float64, (121,1)) .- 1 )
i=1
for x₁ ∈ 0:0.1:1
   for x₂ ∈ 0:0.1:1
     x1[i] = x₁
     x2[i] = x₂
     y[i] = x₁*x₁ + x₂*x₂ + x₁*x₂ + x₁ + x₂ + 1 + perturbation[i]
     i = i+1
   end
end

using DelimitedFiles
open("data-assignment4.csv", "w") do io
  writedlm(io, [x1 x2 y], ',')
end
