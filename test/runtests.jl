using Test

import Chin:
matchOne

@testset "1文字の場合" begin
    @testset "完全一致する場合" begin
        @test matchOne("a", "a") == true
        @test matchOne("b", "b") == true
    end

    @testset ".で一致する場合" begin
        @test matchOne(".", "a") == true
        @test matchOne(".", "b") == true
    end

    @testset "対象文字列が空の場合" begin
        @test matchOne("a", "") == false
        @test matchOne(".", "") == false
    end

    @testset "一致しない場合" begin
        @test matchOne("a", "b") == false
        @test matchOne("a", "c") == false
    end
end
