

const ev_to_K = 11604.52500617u"K"
const e_statC = 4.80320425e-10u"cm^(3/2) * g^(1/2) * s^−1"

"""
    electron_gyrofrequency(B)

The electron gyrofrequency, or the angular frequency of the circular motion of an
electron in the plane perpendicular to the magnetic field.

# Arguments
- `B`: magnetic flux density, typically in units of tesla
"""
function electron_gyrofrequency(B)
    return (e_statC * B) / (ElectronMass * SpeedOfLightInVacuum)
end

"""
    ion_gyrofrequency(B)

The ion gyrofrequency, or the angular frequency of the circular motion of an ion in
the plane perpendicular to the magnetic field.

# Arguments
 - `B`: magnetic flux density, typically in units of tesla
 - `Z`: charge state, unitless
 - `m_i`: ion mass, typically in grams
"""
function ion_gyrofrequency(B, Z, m_i)
    return (Z * e_statC * B) / (m_i * SpeedOfLightInVacuum)
end


"""
    electron_plasma_frequency(n_e)

Electron plasma frequency, or the frequency at which the electrons in the plasma oscillate

# Arguments
 - `n_e`: electron number density, typically in units of 1/cm^3
"""
function electron_plasma_frequency(n_e)
    return sqrt((4π * n_e * e_statC^2) / (ElectronMass |> u"g"))
end

"""
    ion_plasma_frequency(n_i, m_i, Z)

Ion plasma frequency, or the frequency at which the ions in the plasma oscillate

# Arguments
 - `n_i`: ion number density, typically in units of 1/cm^3
 - `Z`: charge state, dimensionless
 - `m_i`: ion mass, e.g., grams
"""
function ion_plasma_frequency(n_i, m_i, Z)
    return sqrt((4π * n_i * Z^2 * e_statC^2) / m_i)
end

"""
# Arguments
 - ``:
"""
function electron_trapping_rate()
end

"""
# Arguments
 - ``:
"""
function ion_trapping_rate()
end

"""
# Arguments
 - ``:
"""
function electron_collision_rate()
end

"""
# Arguments
 - ``:
"""
function ion_collision_rate()
end

"""
# Arguments
 - ``:
"""
function electron_debroglie_length()
end

"""
# Arguments
 - ``:
"""
function classical_minimum_approach_dist()
end

"""
# Arguments
 - ``:
"""
function electron_gryoradius()
end

"""
# Arguments
 - ``:
"""
function ion_gyroradius()
end

"""
# Arguments
 - ``:
"""
function Debye_length()
end

"""
# Arguments
 - ``:
"""
function magnetic_debye_length()
end

"""
    electron_thermal_velocity(T_e)

# Arguments
 - `T_e`: electron temperature in eV
"""
function electron_thermal_velocity(T_e::Unitful.Energy)
    T = ustrip(u"eV", T_e) * ev_to_K
	electron_thermal_velocity(T)
end

function electron_thermal_velocity(T_e::Unitful.Temperature)
	sqrt(T_e * BoltzmannConstant / ElectronMass) |> u"cm/s"
end

"""
# Arguments
 - ``:
"""
function ion_thermal_velocity(T_i, m_i)
    return sqrt((BoltzmannConstant * T_i) / m_i)
end

"""
    ion_sound_velocity(γ, Z, T_e, m_i)

Ion sound speed, the speed of the longitudinal waves resulting from the
mass of the ions and the pressure of the electrons.

# Arguments
 - `γ`: adiabatic index
 - `Z`: charge state
 - `T_e`: electron temperature in eV
 - `m_i`: ion mass
"""
function ion_sound_velocity(γ, Z, T_e, m_i)
    return sqrt(γ * Z * k_B * T_e / m_i)
end

"""
    alfven_velocity(B, n_i, m_i)

The Alfven velocity, the speed of the waves resulting from the mass of the
ions and the restoring force of the magnetic field

# Arguments
 - `B`: magnetic flux, typically in teslas
 - `n_i`: ion number density, typically in 1/cm^3
 - `m_i`: ion mass, typically in grams
"""
function alfven_velocity(B, n_i, m_i)
    return B / sqrt(4π * n_i * m_i)
end
