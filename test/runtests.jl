using Test

import Chin:
    makeArrows, regexp

@testset "遷移の作成" begin
    @test makeArrows("a") == Dict("0-a" => 1)
    @test makeArrows("ab") == Dict("0-a" => 1, "1-b" => 2)
    @test makeArrows("abc") == Dict("0-a" => 1, "1-b" => 2, "2-c" => 3)
end

@testset "0文字の場合" begin
    @test regexp("", "a") == true
    @test regexp("", "b") == true
end

@testset "１文字の場合" begin
    @test regexp("a", "a") == true
    @test regexp("b", "a") == false
end

@testset "連接の場合" begin
    @test regexp("ab", "ab") == true
    @test regexp("aa", "ab") == false
end