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
        automaton1Length = length(automaton1)

        for node in copyAutomaton2
            newNode = []
            for arrow in node
                if :next ∈ keys(arrow)
                    push!(newNode, (next = arrow.next + automaton1Length - 1, value = arrow.value))
                else
                    push!(newNode, ())
                end
            end

            push!(copyAutomaton1, newNode)
        end

        copyAutomaton1[automaton1Length] = copyAutomaton1[automaton1Length + 1]
        popat!(copyAutomaton1, automaton1Length + 1)

        return copyAutomaton1
    end

    function selectionAutomaton(automaton1, automaton2)
        copyAutomaton1 = deepcopy(automaton1)
        copyAutomaton2 = deepcopy(automaton2)

        return [[(next = 1, value = "ϵ"), (next = 2, value = "ϵ")], [()], [()]]
    end

    function main()
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
