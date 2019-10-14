function ℍ(𝕍::Vector{T} where T <: Number)::Vector{T where T <: Number}
	𝔻 = ℍ_evaluate(𝕍)
	return ℍ_(𝔻)
end

function ℍ_evaluate(𝕍::Vector{T} where T <: Number)::Dict{Int, Tuple{T,T} where T <: Number}
	l𝕍 = 1:length(𝕍); e𝕍 = zip(sin.(𝕍), cos.(𝕍)); return Dict(l𝕍 .=> e𝕍)
end

ℍ_(𝔻) = ℍ_(𝔻, [1], 0)
function ℍ_(𝔻::Dict{Int, Tuple{T,T} where T <: Number}, 𝕍::Vector{T} where T <: Number, 𝕖::Int)
	if 𝕖 == length(𝔻)
		return 𝕍
	else
		𝕖 += 1; 𝕍 = append!(𝔻[𝕖][1] .* 𝕍, 𝔻[𝕖][2])
		return ℍ_(𝔻, 𝕍, 𝕖)
	end
end
