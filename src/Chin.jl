module Chin
    # using Printf

    function oneAutomaton(character)
        [
            0 character
            0 0
        ]
    end

    function  connectionAutomaton(s, t)
        A = [s zeros(Int, size(s, 1))]
        A[end] = t[1, end]

        [A; transpose(zeros(Int, size(s, 1)+1))]
    end

    function main()
        # @printf("A=%s\n", string(A))
        # @printf("B=%s\n", string(B))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
