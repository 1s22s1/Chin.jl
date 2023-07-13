using Test

import Chin:
    makeArrows, letterRegexp, regexp

@testset "遷移の作成" begin
    @test makeArrows("a") == Dict("0-a" => 1)
    @test makeArrows("ab") == Dict("0-a" => 1, "1-b" => 2)
    @test makeArrows("abc") == Dict("0-a" => 1, "1-b" => 2, "2-c" => 3)
end

@testset "0文字の場合" begin
    @test letterRegexp("", "a") == true
    @test letterRegexp("", "b") == true
end

@testset "１文字の場合" begin
    @test letterRegexp("a", "a") == true
    @test letterRegexp("b", "a") == false
end

@testset "連接の場合" begin
    @test letterRegexp("ab", "ab") == true
    @test letterRegexp("aa", "ab") == false
end

@testset "総合テスト" begin
    @test regexp("abcd", "abcd") == true
end