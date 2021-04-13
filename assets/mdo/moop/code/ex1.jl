# This file was generated, do not modify it. # hide
using Optim, Plots, JSON, LaTeXStrings
plotlyjs()
x = range(0,stop=1,length=20) # Design space
length(x) = 100*x; weight(x) = 100*x^2 # Functions to optimise
len = map(length,x); w = map(weight,x) #hide
p1 = Plots.plot(len, w, seriestype=:scatter, xlabel="length", ylabel="weight", label="", size=(600,400)) #hide
fdplotly(JSON.json((layout = Plots.plotly_layout(p1), data = Plots.plotly_series(p1),));) #hide