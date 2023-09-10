using Test

import Chin: oneAutomaton, connectionAutomaton, selectionAutomaton, transition, needepsilontransition, isaccept

@testset "Make a character automaton" begin
    @test oneAutomaton("s") == [[(next = 1, value = "s")], []]
    @test oneAutomaton("ϵ") == [[(next = 1, value = "ϵ")], []]
end

@testset "Make connection automaton" begin
    sAutomaton = [[(next = 1, value = "s")], []]
    tAutomaton = [[(next = 1, value = "t")], []]
    uAutomaton = [[(next = 1, value = "u")], []]
    stAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], []]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [[(next = 1, value = "s")], [(next = 2, value = "t")], []]
    @test connectionAutomaton(stAutomaton, uAutomaton) == [[(next = 1, value = "s")], [(next = 2, value = "t")], [(next = 3, value = "u")], []]
    @test connectionAutomaton(uAutomaton, stAutomaton) == [[(next = 1, value = "u")], [(next = 2, value = "s")], [(next = 3, value = "t")], []]
end


@testset "Make select automaton" begin
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

@testset "Transition" begin
    stAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], []]

    @test transition([0], stAutomaton, "s") == [1]
    @test transition([0], stAutomaton, "t") == []
    @test transition([1], stAutomaton, "s") == []
    @test transition([1], stAutomaton, "t") == [2]

    selectionAutomaton = [[(next = 1, value = "ϵ"), (next = 2, value = "ϵ")],[],[]]
    @test transition([0], selectionAutomaton, "ϵ") == [1, 2]
end

@testset "Need epsilon transition" begin
    epsilonAutomaton = [[(next = 1, value = "ϵ")], []]
    sAutomaton = [[(next = 1, value = "s")], []]

    @test needepsilontransition([0], epsilonAutomaton) == true
    @test needepsilontransition([0], sAutomaton) == false
end

@testset "Accept" begin
    sAutomaton = [[(next = 1, value = "s")], []]
    stConnectionAutomaton = [[(next = 1, value = "s")], [(next = 2, value = "t")], []]
    stSelectionAutomaton = [
        [(next = 1, value = "ϵ"), (next = 4, value = "ϵ")],
        [(next = 2, value = "s")],
        [(next = 3, value = "ϵ")],
        [],
        [(next = 5, value = "t")],
        [(next = 3, value = "ϵ")]
    ]

    @test isaccept(sAutomaton, 1, "s") == true
    @test isaccept(sAutomaton, 1, "t") == false

    @test isaccept(stConnectionAutomaton, 2, "st") == true
    @test isaccept(stConnectionAutomaton, 2, "ss") == false
    @test isaccept(stConnectionAutomaton, 2, "ts") == false

    @test isaccept(stSelectionAutomaton, 3, "s") == true
    @test isaccept(stSelectionAutomaton, 3, "t") == true
    @test isaccept(stSelectionAutomaton, 3, "u") == false
end
