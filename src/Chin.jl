module Chin
    using Printf

    function oneAutomaton(character)
        graph = []

        push!(graph, Dict(:next => length(graph) + 1, :value => character))
        push!(graph, Dict())
    end

    function  connectionAutomaton(s, t)
        A = [s zeros(Int, size(s, 1))]
        A[end] = t[1, end]

        [A; transpose(zeros(Int, size(s, 1)+1))]
    end

    function main()
        graph = []

        s = [Dict(:next => 1, :value => "s"), Dict()]
        t = [Dict(:next => 1, :value => "t"), Dict()]

        for d in t
            if :next ∈ keys(d)
                d[:next] = d[:next] + length(s) - 1
            end
        end

        s[end] = merge(s[end], t[begin])
        push!(graph, s)
        push!(graph, t[begin + 1 : end])

        @printf("A=%s\n", string(graph))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
