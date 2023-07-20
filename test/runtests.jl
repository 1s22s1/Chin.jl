using Test

import Chin: oneAutomaton, connectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [Dict(:next => 1, :value => "s"), Dict()]
    @test oneAutomaton("ϵ") == [Dict(:next => 1, :value => "ϵ"), Dict()]
end


@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [Dict(:next => 1, :value => "s"), Dict()]
    tAutomaton = [Dict(:next => 1, :value => "t"), Dict()]
    @test connectionAutomaton(sAutomaton, tAutomaton) == [Dict(:next => 1, :value => "s"), Dict(:next => 2, :value => "t"), Dict()]

    stAutomaton = [Dict(:next => 1, :value => "s"), Dict(:next => 2, :value => "t"), Dict()]
    uAutomaton = [Dict(:next => 1, :value => "u"), Dict()]
    @test connectionAutomaton(stAutomaton, uAutomaton) == [Dict(:next => 1, :value => "s"), Dict(:next => 2, :value => "t"), Dict(:next => 3, :value => "u"), Dict()]

    stAutomaton = [Dict(:next => 1, :value => "s"), Dict(:next => 2, :value => "t"), Dict()]
    uAutomaton = [Dict(:next => 1, :value => "u"), Dict()]
    @test connectionAutomaton(uAutomaton, stAutomaton) == [Dict(:next => 1, :value => "u"), Dict(:next => 2, :value => "s"), Dict(:next => 3, :value => "t"), Dict()]
end
