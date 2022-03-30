

function thermal_electron_electron_collsions()
end

function electron_ion_collisions()
end

"""
# Arguments
 - `μ`: 
 - `μ′`: 
 - `Z`: 
 - `Z′`: 
 - `Tᵢ`: 
 - `Tᵢ′`: 
 - `nᵢ `: 
 - `nᵢ′`: 
"""
function mixed_ion_collisions(μ, μ′, Z, Z′, Tᵢ, Tᵢ′, nᵢ, nᵢ′)
	T1,	T2 = ustrip.(u"eV", (Tᵢ, Tᵢ′))
	n1,	n2 = ustrip.(u"cm^-3", (nᵢ, nᵢ′))
    λᵢᵢ = 23 - log(
        ((Z * Z′ * (μ + μ′)) / (μ * T2 + μ′ * T1)) * 
        √((n1 * Z^2 / T1) + (n2 * Z′^2 / T2)))

    return λᵢᵢ
end

function counter_streaming_ion_collisions(μ, μ′, Z, Z′, Tᵢ, Tᵢ′,nᵢ, nᵢ′)
end