using Test

import Chin: matchOneAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test matchOneAutomaton("a") == [0 "a"; 0 0]
    @test matchOneAutomaton("ϵ") == [0 "ϵ"; 0 0]
end
