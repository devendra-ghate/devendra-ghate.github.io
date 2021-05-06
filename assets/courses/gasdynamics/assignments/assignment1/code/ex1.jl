# This file was generated, do not modify it. # hide
using JuMP
using Ipopt

function AbyAₜ(x, xₜ, cᵣ, dᵣ)
	if x >= 0 && x < xₜ
		58*(x-xₜ)^2 + 1
	elseif x >= xₜ && x <= 1
		58*(xₜ^2+1)/14*(x-xₜ)^2 + 1
	end
end
plot(x -> AbyAₜ(x, 0.5, 400, 100), 0, 1)
plot!(x -> AbyAₜ(x, 0.25, 400, 100), 0, 1)
#plot!(x -> AbyAₜ(x, 0.5, 100, 100), 0, 1)
#plot!(x -> AbyAₜ(x, 0.25, 100, 5), 0, 1)

println(58/4.2)
function mdotmax(p₀, T₀, γ, R)
	p₀*( γ/R/T₀*(2/γ+1)^( (γ+1)/(γ-1) ) )^0.5
end

function arearatio(γ, M)
	( (γ+1)/2 )^( -(γ+1)/2/(γ-1) ) / M * ( 1 + (γ-1)/2*M^2 )^( (γ+1)/2/(γ-1) )
end

function M(x, M, γ=1.4)
        """
        Function to calculate shock angle for weak oblique shock
        """
          model = Model(Ipopt.Optimizer)
          @variable(model, M, start = 1)
          @NLparameter(model, gamma == γ)
          @NLparameter(model, Mach == M)
          @NLobjective(model, Min, 1)
          #@NLconstraint(model,0 <= beta <= 90)
          register(model, :f_1, 3, f_1, autodiff=true)
          @NLconstraint(model, eq, f_1(M1, beta, gamma) == theta)
          print(model)
          optimize!(model)
          if M₁*sind(value(beta)) >= 1
           value(beta)
          else
                  display(errormsg)
          end
end