using Test

import Chin:
    regexp

@testset "Chin.jl" begin
    # 入力する情報を制限する。一旦はaまたはb
    @test regexp("a", "a") == true
end
