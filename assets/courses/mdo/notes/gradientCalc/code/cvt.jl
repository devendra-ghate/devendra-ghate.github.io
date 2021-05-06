# This file was generated, do not modify it. # hide
using PyPlot
using LinearAlgebra
using Printf

N = 15
x0 = 1.0
f(x)=x*x*x
∇f(x) = 3*x*x

∇f_cd(x,Δx) = (f(x+Δx) - f(x-Δx))/2Δx
∇f_cs(x,Δx) = imag(f(x0 + im*Δx)/Δx)

err1=zeros(N,1); err2 = zeros(N,1)
Δx = 10.0.^collect(-1:-1:-N)
for j=1:N
    err1[j]=norm(∇f_cs(x0,Δx[j]) - ∇f(x0))
    err2[j]=norm(∇f_cd(x0,Δx[j]) - ∇f(x0))
end
pygui(false)
figure()
loglog(Δx,err1,label="Complex Step Differentiation")
loglog(Δx,err2,label="Central difference")
xlabel("Step Size"); ylabel("Error ")
title("Error Vs Step Size for complex variable trick and central difference methods")
grid("on"); legend(loc="upper right",fancybox="true")
savefig(joinpath(@OUTPUT, "cvt.svg")) # hide