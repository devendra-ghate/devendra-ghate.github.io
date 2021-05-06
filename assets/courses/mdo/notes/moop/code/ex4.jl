# This file was generated, do not modify it. # hide
## Strategy 1: Weighted Sum method with normalised objective functions
weight1(x) = x^2; drag1(x) = ((x-2)^2 - 1)/3;
w = map(weight1,x); dr = map(drag1,x)
p4 = Plots.plot(w, dr, seriestype=:scatter, xlabel="weight", ylabel="drag", label="") #hide
# Weighted objective function
f4(x) = w1*weight1(x) + w2*drag1(x)
w1 = 0.0; w2 = 1.0;
res = optimize(f4, 0, 1)
Plots.plot!(p4, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="0-100") #hide
w1 = 0.1; w2 = 0.9
res = optimize(f4, 0, 1)
Plots.plot!(p4, [weight1(res.minimizer[1])] , [drag1(res.minimizer[1])],markershape=:diamond, label="10-90") #hide
w1 = 0.5; w2 = 0.5;
res = optimize(f4, 0, 1)
Plots.plot!(p4, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="50-50") #hide
w1 = 0.9; w2 = 0.1
res = optimize(f4, 0, 1)
Plots.plot!(p4, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="90-10") #hide
w1 = 1.0; w2 = 0.0;
res = optimize(f4, 0, 1)
Plots.plot!(p4, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="100-0") #hide
savefig(joinpath(@OUTPUT, "ex4.svg")) # hide