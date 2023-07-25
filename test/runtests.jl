using Test

import Chin: oneAutomaton, connectionAutomaton, selectionAutomaton, transition, needepsilontransition, isaccept

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

    @test selectionAutomaton(stAutomaton, uAutomaton) == [
        [(next = 1, value = "ϵ"), (next = 5, value = "ϵ")],
        [(next = 2, value = "s")],
        [(next = 3, value = "t")],
        [(next = 4, value = "ϵ")],
        [],
        [(next = 6, value = "u")],
        [(next = 4, value = "ϵ")]
    ]

    @test  selectionAutomaton(uAutomaton, stAutomaton) == [
        [(next = 1, value = "ϵ"), (next = 4, value = "ϵ")],
        [(next = 2, value = "u")],
        [(next = 3, value = "ϵ")],
        [],
        [(next = 5, value = "s")],
        [(next = 6, value = "t")],
        [(next = 3, value = "ϵ")]
    ]
end

@testset "遷移する" begin
    stAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], []]

    @test transition([0], stAutomaton, "s") == [1]
    @test transition([0], stAutomaton, "t") == []
    @test transition([1], stAutomaton, "s") == []
    @test transition([1], stAutomaton, "t") == [2]

    selectionAutomaton = [[(next = 1, value = "ϵ"), (next = 2, value = "ϵ")],[],[]]
    @test transition([0], selectionAutomaton, "ϵ") == [1, 2]
end

@testset "ϵ遷移の必要性の判定" begin
    epsilonAutomaton = [[(next = 1, value = "ϵ")], []]
    sAutomaton = [[(next = 1, value = "s")], []]

    @test needepsilontransition(0, epsilonAutomaton) == true
    @test needepsilontransition(0, sAutomaton) == false
end

@testset "受理する" begin
    sAutomaton = [[(next = 1, value = "s")], []]

    @test isaccept(sAutomaton, 1, "s") === nothing
end
