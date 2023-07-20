module Chin
    # using Printf

    function oneAutomaton(character)
        graph = []

        push!(graph, Dict(:next => length(graph) + 1, :value => character))
        push!(graph, Dict())
    end

    function connectionAutomaton(automaton1, automaton2)
        map(d->  d[:next] = d[:next] + length(automaton1) - 1, filter(d->:next ∈ keys(d), automaton2))

        automaton1[end] = merge(automaton1[end], automaton2[begin])

        # automaton1
        # automaton2[begin + 1 : end]

        [automaton1; automaton2[begin + 1 : end]]
    end

    function main()
        # graph = []
        # automaton1 = [Dict(:next => 1, :value => "u"), Dict()]
        # automaton2 = [Dict(:next => 1, :value => "s"), Dict(:next => 2, :value => "t"), Dict()]

        # map(d->  d[:next] = d[:next] + length(automaton1) - 1, filter(d->:next ∈ keys(d), automaton2))

        # automaton1[end] = merge(automaton1[end], automaton2[begin])
        # graph = [automaton1; automaton2[begin + 1 : end]]

        # @printf("A=%s\n", string(graph))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
