const ev_to_K = 11604.52500617u"K"


@testset "Frequencies" begin
    n_e = 1.0u"1/cm^3"
    ω_pe = electron_plasma_frequency(n_e)
    ω_pe_approx = 5.64e4 * sqrt(n_e |> ustrip) * u"s^-1"
    @test isapprox(ω_pe, ω_pe_approx, atol=1e2u"s^-1")

    n_i = 1.0u"1/cm^3"
    Z = 1.0
    m_i = 1.0u"g"
    μ = (m_i / ProtonMass) |> NoUnits
    ω_pi = ion_plasma_frequency(n_i, m_i, Z)
    ω_pi_approx = 1.32e3 * Z * μ^(-1/2) * sqrt(n_i |> ustrip) * u"s^-1"
    @test isapprox(ω_pi, ω_pi_approx, atol=1u"s^-1")
end

@testset "Velocities" begin
    T_eV = 1u"eV"
    TK = ustrip(u"eV", T_eV) * ev_to_K
    @test isapprox(electron_thermal_velocity(TK), 4.19e7u"cm/s", atol=1e5u"cm/s")
    @test isapprox(electron_thermal_velocity(T_eV), 4.19e7u"cm/s", atol=1e5u"cm/s")
end
