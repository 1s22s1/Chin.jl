using Test

import Chin:
matchOne, match

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

@testset "1文字より長い場合" begin
    @testset "完全一致する場合" begin
        @test match("ab", "ab") == true
        @test match("abc", "abc") == true
        @test match("abcd", "abcd") == true
    end

    @testset "一致しない場合" begin
        @test match("ab", "aa") == false
        @test match("ab", "ba") == false
        @test match("ab", "bb") == false
    end
end
