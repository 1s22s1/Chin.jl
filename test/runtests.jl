using Test

import Chin: oneAutomaton, connectionAutomaton, selectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [[(next = 1, value = "s")], [()]]
    @test oneAutomaton("ϵ") == [[(next = 1, value = "ϵ")], [()]]
end

@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [[(next = 1, value = "s")], [()]]
    tAutomaton = [[(next = 1, value = "t")], [()]]
    uAutomaton = [[(next = 1, value = "u")], [()]]
    stAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], [()]]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [[(next = 1, value = "s")], [(next = 2, value = "t")], [()]]
    @test connectionAutomaton(stAutomaton, uAutomaton) == [[(next = 1, value = "s")], [(next = 2, value = "t")], [(next = 3, value = "u")], [()]]
    @test connectionAutomaton(uAutomaton, stAutomaton) == [[(next = 1, value = "u")], [(next = 2, value = "s")], [(next = 3, value = "t")], [()]]
end


@testset "選択に対するオートマトンを作成する" begin
    sAutomaton = [[(next = 1, value = "s")], [()]]
    tAutomaton = [[(next = 1, value = "t")], [()]]

    @test selectionAutomaton(sAutomaton, tAutomaton) == [[(next = 1, value = "ϵ"), (next = 4, value = "ϵ")], [(next = 2, value = "s")], [(next = 3, value = "ϵ")], [()], [(next = 5, value = "t")]]
end
