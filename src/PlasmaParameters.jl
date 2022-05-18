module PlasmaParameters

using Unitful, PhysicalConstants.CODATA2018

export electron_gyrofrequency, ion_gyrofrequency,
    electron_plasma_frequency, ion_plasma_frequency,
    electron_trapping_rate, ion_trapping_rate,
    electron_collision_rate, ion_collision_rate,
    electron_debroglie_length, classical_minimum_approach_dist,
    electron_gryoradius, ion_gyroradius,
    debye_length, magnetic_debye_length,
    electron_thermal_velocity, ion_thermal_velocity,
    ion_sound_velocity, alfven_velocity

include("fundamental_plasma_params.jl")

end
