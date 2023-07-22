using Test

import Chin: oneAutomaton, connectionAutomaton, selectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [(:next => 1, :value => "s"), ()]
    @test oneAutomaton("ϵ") == [(:next => 1, :value => "ϵ"), ()]
end

@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [(:next => 1, :value => "s"), ()]
    tAutomaton = [(:next => 1, :value => "t"), ()]
    uAutomaton = [(:next => 1, :value => "u"), ()]
    stAutomaton = [(:next => 1, :value => "s"), (:next => 2, :value => "t"), ()]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [(:next => 1, :value => "s"), (:next => 2, :value => "t"), ()]
    # @test connectionAutomaton(stAutomaton, uAutomaton) == [Dict(:next => 1, :value => "s"), Dict(:next => 2, :value => "t"), Dict(:next => 3, :value => "u"), Dict()]
    # @test connectionAutomaton(uAutomaton, stAutomaton) == [Dict(:next => 1, :value => "u"), Dict(:next => 2, :value => "s"), Dict(:next => 3, :value => "t"), Dict()]
end

@testset "選択に対するオートマトンを作成する" begin
    sAutomaton = [Dict(:next => 1, :value => "s"), Dict()]
    tAutomaton = [Dict(:next => 1, :value => "t"), Dict()]

    @test selectionAutomaton(sAutomaton, tAutomaton) == true
end
