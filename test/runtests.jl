using Test

import Chin:
    regexp

@testset "Chin.jl" begin
    @test regexp("a", "a") == true
    @test regexp("b", "a") == false
end
