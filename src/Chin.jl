module Chin
    using Printf

    function oneAutomaton(character)
        [
            0 character
            0 0
        ]
    end

    function  connectionAutomaton(s, t)
        # f = t[1, end]
        # A = zeros(Int, ndims(s))
        # A[end] = f

        # B = [s, A]

        # B
    end

    function main()
        s = oneAutomaton("s")
        t = oneAutomaton("t")

        A = [s zeros(Int, ndims(s))]
        A[end] = t[1, end]
        B = [A; transpose(zeros(Int, ndims(s)+1))]

        @printf("A=%s\n", string(A))
        @printf("B=%s\n", string(B))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
