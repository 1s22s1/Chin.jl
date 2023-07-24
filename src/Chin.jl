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

        for node in copyAutomaton2
            newNode = []
            for arrow in node
                if :next ∈ keys(arrow)
                    push!(newNode, (next = arrow.next + length(automaton1) - 1, value = arrow.value))
                else
                    push!(newNode, ())
                end
            end

            push!(copyAutomaton1, newNode)
        end

        return copyAutomaton1
    end

    function main()
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
