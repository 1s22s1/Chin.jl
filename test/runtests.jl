using Test

import Chin:
    regexp

@testset "Chin.jl" begin
    @test regexp("a", "a") == true
    @test regexp("a", "b") == false
    @test regexp("a", "c") == false
end
