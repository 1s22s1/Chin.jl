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

    # stAutomaton = [0 "s" 0; 0 0 "t"; 0 0 0]
    # uAutomaton = [0 "u"; 0 0]

    # @test connectionAutomaton(stAutomaton, uAutomaton) == [0 "s" 0 0; 0 0 "t" 0; 0 0 0 "u"; 0 0 0 0]
end
