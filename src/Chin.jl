module Chin
    # using Printf

    function oneAutomaton(character)
        graph = []

        push!(graph, [(:next => length(graph) + 1, :value => character)])
        push!(graph, [()])
    end

    function connectionAutomaton(automaton1, automaton2)
        copyAutomaton1 = deepcopy(automaton1)
        copyAutomaton2 = deepcopy(automaton2)

        map(d->  d[:next] = d[:next] + length(copyAutomaton1) - 1, filter(d->:next ∈ keys(d), copyAutomaton2))
        push!(copyAutomaton1[end], copyAutomaton2[begin])

        [copyAutomaton1; copyAutomaton2[begin + 1 : end]]
    end

    function selectionAutomaton(automaton1, automaton2)
        true
    end

    function main()
        # sAutomaton = oneAutomaton("s")
        # tAutomaton = oneAutomaton("t")

        # selectionAutomaton = connectionAutomaton(oneAutomaton("ϵ"), sAutomaton)
        # selectionAutomaton = connectionAutomaton(selectionAutomaton, oneAutomaton("ϵ"))

        # map(d->  d[:next] = d[:next] + length(selectionAutomaton), filter(d->:next ∈ keys(d), tAutomaton))


        # @printf("tAutomaton=%s\n", string(tAutomaton))
        # @printf("selectionAutomaton=%s\n", string(selectionAutomaton))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
