using PyPlot
ΔE = range(0.0001,1,length=100)
p(ΔE) = exp.(-ΔE)
plot(ΔE, p(ΔE))
savefig(joinpath(@OUTPUT, "sa.svg") ) # hide
