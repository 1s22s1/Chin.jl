using Test

import Chin: Arrow, matchOneAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test matchOneAutomaton("a") == Arrow(0, 1, "a")
    @test matchOneAutomaton("ϵ") == Arrow(0, 1, "ϵ")
end
