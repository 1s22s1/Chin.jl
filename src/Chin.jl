module Chin
    # using Printf

    function oneAutomaton(character)
        graph = []

        edge = Dict(:next => length(graph) + 1, :value => character)
        push!(graph, edge)
    end

    function  connectionAutomaton(s, t)
        A = [s zeros(Int, size(s, 1))]
        A[end] = t[1, end]

        [A; transpose(zeros(Int, size(s, 1)+1))]
    end

    function main()
        # char = "s"
        # graph = []

        # edge = Dict(:nextEdge => length(graph) + 1, :value => char)
        # push!(graph, edge)

        # @printf("A=%s\n", string(graph))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
