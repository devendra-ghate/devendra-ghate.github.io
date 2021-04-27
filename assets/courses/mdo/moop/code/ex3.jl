# This file was generated, do not modify it. # hide
# Weighted objective function
w1 = 0.5; w2 = 0.5
f4(x) = w1*weight(x) + w2*drag(x)
res = optimize(f4, -1, 1)
p3 = p2 #hide
Plots.plot!(p3, [ weight(res.minimizer[1]) ], [ drag(res.minimizer[1]) ],markershape=:diamond, label="50-50")#hide
w1 = 0.1; w2 = 0.9
res = optimize(f4, -1, 1)
Plots.plot!(p3, [ weight(res.minimizer[1]) ], [ drag(res.minimizer[1]) ],markershape=:diamond, label="10-90")#hide
w1 = 0.01; w2 = 0.99
res = optimize(f4, -1, 1)
Plots.plot!(p3, [ weight(res.minimizer[1]) ], [ drag(res.minimizer[1]) ],markershape=:diamond, label="1-99")#hide
savefig(joinpath(@OUTPUT, "ex3.svg")) # hide