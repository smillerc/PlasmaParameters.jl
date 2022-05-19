
"""
    critical_density(λ_laser)

Critical density of a plasma [cm^-3]

# Arguments
 - `λ_laser`: laser light wavelength, usually in nm
"""
function critical_density(λ_laser)
    return ((ElectronMass * π * SpeedOfLightInVacuum^2) /
            (λ_laser^2 * e_statC^2)) |> u"cm^-3"
end


"""

Refractive index of a plasma

# Arguments
 - `n_e`: electron number density, usually in cm^-3
 - `λ_laser`: laser light wavelength, usually in nm
"""
function refractive_index(n_e, λ_laser)
    η = 1 - (n_e / critical_density(λ_laser)) |> NoUnits
    return η
end
