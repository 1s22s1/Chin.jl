using Test

import Chin: oneAutomaton, connectionAutomaton, selectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [[(next = 1, value = "s")], []]
    @test oneAutomaton("ϵ") == [[(next = 1, value = "ϵ")], []]
end

@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [[(next = 1, value = "s")], []]
    tAutomaton = [[(next = 1, value = "t")], []]
    uAutomaton = [[(next = 1, value = "u")], []]
    stAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], []]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [[(next = 1, value = "s")], [(next = 2, value = "t")], []]
    @test connectionAutomaton(stAutomaton, uAutomaton) == [[(next = 1, value = "s")], [(next = 2, value = "t")], [(next = 3, value = "u")], []]
    @test connectionAutomaton(uAutomaton, stAutomaton) == [[(next = 1, value = "u")], [(next = 2, value = "s")], [(next = 3, value = "t")], []]
end


@testset "選択に対するオートマトンを作成する" begin
    sAutomaton = [[(next = 1, value = "s")], []]
    tAutomaton = [[(next = 1, value = "t")], []]
    uAutomaton = [[(next = 1, value = "u")], []]
    stAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], []]

    @test selectionAutomaton(sAutomaton, tAutomaton) == [
        [(next = 1, value = "ϵ"), (next = 4, value = "ϵ")],
        [(next = 2, value = "s")],
        [(next = 3, value = "ϵ")],
        [],
        [(next = 5, value = "t")],
        [(next = 3, value = "ϵ")]
    ]

    expectedAutomaton = selectionAutomaton(stAutomaton, uAutomaton)

    @test expectedAutomaton[1] ==  [(next = 1, value = "ϵ"), (next = 5, value = "ϵ")]
    @test expectedAutomaton[2] ==  [(next = 2, value = "s")]
    @test expectedAutomaton[3] ==  [(next = 3, value = "t")]
    @test expectedAutomaton[4] ==  [(next = 4, value = "ϵ")]
    @test expectedAutomaton[5] ==  []
    @test expectedAutomaton[6] ==  [(next = 6, value = "u")]
    @test expectedAutomaton[7] ==  [(next = 4, value = "ϵ")]

    @test selectionAutomaton(stAutomaton, uAutomaton) == [
        [(next = 1, value = "ϵ"), (next = 5, value = "ϵ")],
        [(next = 2, value = "s")],
        [(next = 3, value = "t")],
        [(next = 4, value = "ϵ")],
        [],
        [(next = 6, value = "u")],
        [(next = 4, value = "ϵ")]
    ]
end
