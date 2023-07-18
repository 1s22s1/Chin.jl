using Test

import Chin: oneAutomaton, connectionAutomaton

@testset "一文字に対するオートマトンを作成する" begin
    @test oneAutomaton("s") == [0 "s"; 0 0]
    @test oneAutomaton("ϵ") == [0 "ϵ"; 0 0]
end


@testset "連接に対するオートマトンを作成する" begin
    sAutomaton = [0 "s"; 0 0]
    tAutomaton = [0 "t"; 0 0]

    @test connectionAutomaton(sAutomaton, tAutomaton) == [0 "s" 0; 0 0 "t"; 0 0 0]
end
