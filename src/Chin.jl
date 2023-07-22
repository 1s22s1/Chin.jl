module Chin
    # using Printf

    function oneAutomaton(character)
        automaton = []

        push!(automaton, [(next = length(automaton) + 1, value = character)])
        push!(automaton, [()])
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

        # copyAutomaton1 = deepcopy(sAutomaton)
        # copyAutomaton2 = deepcopy(tAutomaton)

        # for node in copyAutomaton2
        #     for arrow in node
        #         @printf("arrow=%s\n", string(arrow))
        #     end
        # end

        # @printf("copyAutomaton1=%s\n", string(copyAutomaton1))
        # @printf("copyAutomaton2=%s\n", string(copyAutomaton2))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
