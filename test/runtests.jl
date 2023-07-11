using Test

import Chin:
    regexp

@testset "Chin.jl" begin
    @test regexp("a|b", "a") == true
end
