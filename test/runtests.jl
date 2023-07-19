using Test

import Chin: oneAutomaton, connectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [Dict(:next => 1, :value => "s")]
    @test oneAutomaton("ϵ") == [Dict(:next => 1, :value => "ϵ")]
end


@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [0 "s"; 0 0]
    tAutomaton = [0 "t"; 0 0]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [0 "s" 0; 0 0 "t"; 0 0 0]

    stAutomaton = [0 "s" 0; 0 0 "t"; 0 0 0]
    uAutomaton = [0 "u"; 0 0]

    @test connectionAutomaton(stAutomaton, uAutomaton) == [0 "s" 0 0; 0 0 "t" 0; 0 0 0 "u"; 0 0 0 0]
end
