using Test

import Chin: oneAutomaton, connectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [[(next = 1, value = "s")], [()]]
    @test oneAutomaton("ϵ") == [[(next = 1, value = "ϵ")], [()]]
end

@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [[(next = 1, value = "s")], [()]]
    tAutomaton = [[(next = 1, value = "t")], [()]]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [[(next = 1, value = "s")], [()], [(next = 1, value = "t")], [()]]
end
