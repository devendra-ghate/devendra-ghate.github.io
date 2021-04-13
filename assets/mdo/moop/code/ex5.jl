# This file was generated, do not modify it. # hide
## Strategy 2: Weighted Min-Max method
weight1(x) = x^2; drag1(x) = ((x-2)^2 - 1)/3;
w = map(weight1,x); dr = map(drag1,x)
p5 = Plots.plot(w, dr, seriestype=:scatter, xlabel="weight", ylabel="drag", label="") #hide
# Weighted objective function
f5(x) = max(w1*(weight1(x) - 0), w2*(drag1(x) - 0))
w1 = 0.0; w2 = 1.0;
res = optimize(f5, 0, 1)
Plots.plot!(p5, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="0-100") #hide
w1 = 0.1; w2 = 0.9
res = optimize(f5, 0, 1)
Plots.plot!(p5, [weight1(res.minimizer[1])] , [drag1(res.minimizer[1])],markershape=:diamond, label="10-90") #hide
w1 = 0.5; w2 = 0.5;
res = optimize(f5, 0, 1)
Plots.plot!(p5, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="50-50") #hide
w1 = 0.9; w2 = 0.1
res = optimize(f5, 0, 1)
Plots.plot!(p5, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="90-10") #hide
w1 = 1.0; w2 = 0.0;
res = optimize(f5, 0, 1)
Plots.plot!(p5, [weight1(res.minimizer[1])], [drag1(res.minimizer[1])],markershape=:diamond, label="100-0") #hide
fdplotly(JSON.json((layout = Plots.plotly_layout(p4), data = Plots.plotly_series(p4),)); style = "width:150px;height:150x",) #hide