using Test

import Chin:
makeConnectionArrows, connectionRegexp, selectRegexp, regexp

@testset "連接の場合" begin
    @testset "遷移の作成" begin
        @test makeConnectionArrows("a") == Dict("0-a" => 1)
        @test makeConnectionArrows("ab") == Dict("0-a" => 1, "1-b" => 2)
        @test makeConnectionArrows("abc") == Dict("0-a" => 1, "1-b" => 2, "2-c" => 3)
    end

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

@testset "選択の場合" begin
    @testset "2つからの選択の場合" begin
        @test selectRegexp("a", "a|b") == true
        # @test selectRegexp("b", "a|b") == true
        # @test selectRegexp("c", "a|b") == true
    end
end

@testset "総合テスト" begin
    @test regexp("abcd", "abcd") == true
end
