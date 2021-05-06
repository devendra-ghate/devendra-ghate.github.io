# This file was generated, do not modify it. # hide
#Functions to optimise
drag(x) = (x-2)^2; dr = map(drag,x)
p2 = Plots.plot(w, dr, seriestype=:scatter, xlabel="weight", ylabel="drag", label="") #hide
savefig(joinpath(@OUTPUT, "ex2.svg")) # hide