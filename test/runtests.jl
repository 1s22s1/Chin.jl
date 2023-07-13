using Test

import Chin:
    makeArrows, connectionRegexp, regexp

@testset "遷移の作成" begin
    @test makeArrows("a") == Dict("0-a" => 1)
    @test makeArrows("ab") == Dict("0-a" => 1, "1-b" => 2)
    @test makeArrows("abc") == Dict("0-a" => 1, "1-b" => 2, "2-c" => 3)
end

@testset "連接の場合" begin
    @testset "0文字の場合" begin
        @test connectionRegexp("", "a") == true
        @test connectionRegexp("", "b") == true
    end

    @testset "1文字の場合" begin
        @test connectionRegexp("a", "a") == true
        @test connectionRegexp("b", "a") == false
    end

    @testset "2文字の場合" begin
        @test connectionRegexp("ab", "ab") == true
        @test connectionRegexp("aa", "ab") == false
    end

    @testset "正規表現と対象文字列の長さが異なる場合" begin
        @test connectionRegexp("a", "ab") == false
    end
end

@testset "総合テスト" begin
    @test regexp("abcd", "abcd") == true
end