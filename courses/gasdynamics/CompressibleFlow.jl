# module CompressibleFlow

module IsentropicFlow # {{{

export T₂byT₁

function T₂byT₁(M₁, M₂, γ=1.4)
  ( 1 + M₂^2 * (γ-1)/2)/( 1 + M₁^2 * (γ-1)/2)
end

function p₂byp₁(M₁, M₂, γ=1.4)
  T₂byT₁(M₁, M₂, γ=1.4)^( γ / (γ-1) )
end

function ρ₂byρ₁(M₁, M₂, γ=1.4)
  T₂byT₁(M₁, M₂, γ=1.4)^( 1 / (γ-1) )
end

end # }}} module IsentropicFlow

# module NormalShock # {{{

# function M₂(M₁, γ=1.4)
	# sqrt( (1 + (γ-1)/2*M₁^2)/(γ*M₁^2 - (γ-1)/2) )
# end

# function ρ₂byρ₁(M₁, γ=1.4)
  # (γ+1)*M₁^2 / ( (γ-1)*M₁^2 + 2)
# end

# function p₂byp₁(M₁, γ=1.4)
	# (1 + γ*M₁^2)/(1 + γ*M₂(M₁,γ)^2)
# end

# function T₂byT₁(M₁, γ=1.4)
	# p₂byp₁(M₁, γ)/ρ₂byρ₁(M₁, γ)
	# #(1 + (γ-1)/2*M₁^2)/(1 + (γ-1)/2*M₂(M₁,γ)^2)
	# #1 + ( 2*(γ-1)/(γ+!)^2 )*( (γ*M₁^2 + 1)*(M₁^2-1)/M₁^2 )
# end

# function u₂byu₁(M₁, γ=1.4)
   # 1.0/ρ₂byρ₁(M₁, γ=1.4)
# end

# function ΔsbyR(M₁, γ=1.4)
  # γ/(γ-1)*log(T₂byT₁(M₁, γ)) - log(p₂byp₁(M₁, γ))
# #	γ/(γ-1)*log( 1 + (2*( (γ-1)/(γ+1)^2 ) )*( (γ*M₁^2 + 1)/M₁^2 )*( M₁^2 -1 ) ) - log( 1 + 2γ/(γ+1)*(M₁^2 -1) )
# end

# function p02byp01(M₁, γ=1.4)
	# exp(-ΔsbyR(M₁, γ))
# end

# function T02byT01(M₁, γ=1.4)
   # # 1.0
   # round(T₂byT₁(M₁, γ)*( 1 + ((γ-1)*M₂(M₁,γ)^2)/2 )/( 1 + ((γ-1)*M₁^2)/2 ))
# end

# end # }}} Module NormalShock

# module ObliqueShock # {{{

# using JuMP
# using Ipopt

# import ..NormalShock

# errormsg = "Infeasible Solution: Normal Mach number is subsonic."

# function θ(M₁, β, γ=1.4)
  # if M₁*sind(β) >= 1
   # atand( 2cotd(β)* (M₁^2*sind(β)^2 - 1 )/( M₁^2*(γ + cosd(2β)) + 2 ) )
  # else
	# display(errormsg)
   # 0.0
  # end
# end

# f_1(M₁, β, γ=1.4) = atand( 2cotd(β)* (M₁^2*sind(β)^2 - 1 )/( M₁^2*(γ + cosd(2β)) + 2 ) )

# """
# Function to calculate shock angle for weak oblique shock
# ```jldoctest
   
# ```
# """
# function βw(M₁, theta, γ=1.4)
	  # model = Model(Ipopt.Optimizer)
	  # @variable(model, beta, start = 10)
	  # @NLparameter(model, gamma == γ)
	  # @NLparameter(model, M1 == M₁)
	  # @NLobjective(model, Min, 1)
	  # @NLconstraint(model,0 <= beta <= 90)
	  # register(model, :f_1, 3, f_1, autodiff=true)
	  # @NLconstraint(model, eq, f_1(M1, beta, gamma) == theta)
	  # print(model)
	  # optimize!(model)
	  # if M₁*sind(value(beta)) >= 1
		# value(beta)
	  # else
		  # display(errormsg)
        # 0.0
	  # end
# end

# function βs(M₁, theta, γ=1.4)
	# """
	# Function to calculate shock angle for weak oblique shock
	# """
	  # model = Model(Ipopt.Optimizer)
	  # @variable(model, beta, start = 80)
	  # @NLparameter(model, gamma == γ)
	  # @NLparameter(model, M1 == M₁)
	  # @NLobjective(model, Min, 1)
	  # @NLconstraint(model,0 <= beta <= 90)
	  # register(model, :f_1, 3, f_1, autodiff=true)
	  # @NLconstraint(model, eq, f_1(M1, beta, gamma) == theta)
	  # print(model)
	  # optimize!(model)
	  # if M₁*sind(value(beta)) >= 1
		# value(beta)
	  # else
		  # display(errormsg)
        # 0.0
	  # end
# end

# function M₂(M₁, β, γ=1.4)
  # if M₁*sind(β) >= 1
    # sqrt( NormalShock.M₂(M₁*sind(β), γ)^2 + (M₁*cosd(β))^2 )
  # else
    # display(errormsg)
  # end
# end

# function ρ₂byρ₁(M₁, β, γ=1.4)
  # NormalShock.ρ₂byρ₁( M₁*sind(β), γ)
# end

# function p₂byp₁(M₁, β, γ=1.4)
   # NormalShock.p₂byp₁(M₁*sind(β), γ)
# end

# function T₂byT₁(M₁, β, γ=1.4)
   # NormalShock.T₂byT₁(M₁*sind(β), γ)
# end

# function ΔsbyR(M₁, β, γ=1.4)
  # γ/(γ-1)*log(NormalShock.T₂byT₁(M₁*sind(β), γ)) - log(NormalShock.p₂byp₁(M₁*sind(β), γ))
# end

# function p02byp01(M₁, β, γ=1.4)
	# exp(-NormalShock.ΔsbyR(M₁*sind(β), γ))
# end

# function T02byT01(M₁, β, γ=1.4)
   # 1.0
# end

# function T02byT01(M₁, β, γ=1.4)
   # p02byp01(M₁, β, γ=1.4)/T02byT01(M₁, β, γ=1.4)
# end

# end # }}} module ObliqueShock

# module RayleighFlow # {{{

# function ρ₂byρ₁(M₁, β, γ=1.4)

# end

# function p₂byp₁(M₁, γ=1.4)

# function T₂byT₁(M₁, γ=1.4)

# function ΔsbyR(M₁, γ=1.4)



# end # }}}

#end #module CompressibleFlow
