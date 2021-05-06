# This file was generated, do not modify it. # hide
# A comparison between forward,central and backward difference scheme
using PyPlot

x0=1;

f(x) = x*x*x - x*x + 2.0x + 2.0;
#f(x)=x*x*x;
#f(x)=sin(x);
#f(x)=sin(x)+cos(x);

dx=zeros(18,1)
for i = 1:18;
    dx[i]=10.0^-i
end

err1=zeros(18,1)
err2=zeros(18,1)
err3=zeros(18,1)
for j=1:18;
    err1[j]=abs((f(x0+dx[j])-f(x0))/dx[j] - 3.0*x0*x0+2.0x0*x0-2.0)
    # doesnt work good for x=2,3,4
    err2[j]=abs((f(x0+dx[j])-f(x0-dx[j]))/2/dx[j] - 3.0*x0*x0+2.0x0*x0-2.0)
    err3[j]=abs((f(x0)-f(x0-dx[j]))/dx[j] - 3.0*x0*x0+2.0x0*x0-2.0)
    #err[j]=abs((f(x0+dx[j])-f(x0-dx[j]))/2/dx[j] - 3.0*x0*x0) # good for all x0 best 1,2
    #err[j]=abs((f(x0+dx[j])-f(x0-dx[j]))/2/dx[j] - cos(x0)) #fails at x=0
    #err[j]=abs((f(x0+dx[j])-f(x0-dx[j]))/2/dx[j] - cos(x0)+sin(x0))

end
pygui(false)
figure()
loglog(dx,err1,"-*",linewidth=2,label="Forward difference")
loglog(dx,err2,"-o",linewidth=2,label="Central difference")
loglog(dx,err3,"-s",linewidth=1,label="Backward difference")
xlabel("Step Size")
ylabel("Error ")
title("Error Vs Step Size for finite difference methods")
grid("on")
legend(loc="upper right",fancybox="true")
savefig(joinpath(@OUTPUT, "fd.svg")) # hide