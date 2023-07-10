using Chin
using Test

@testset "Chin.jl" begin
    @test regexp("a|b", a) == true
end
