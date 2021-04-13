# This file was generated, do not modify it. # hide
#Functions to optimise
drag(x) = (x-2)^2; dr = map(drag,x)
p2 = Plots.plot(w, dr, seriestype=:scatter, xlabel="weight", ylabel="drag", label="") #hide
fdplotly(JSON.json((layout = Plots.plotly_layout(p2), data = Plots.plotly_series(p2),)); style = "width:150px;height:150x",) #hide