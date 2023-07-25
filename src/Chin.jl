module Chin
    # using Printf

    # ０からノード番号を数える。
    function oneAutomaton(character)
        automaton = []

        push!(automaton, [(next = length(automaton) + 1, value = character)])
        push!(automaton, [])
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

        returnAutomaton = connectionAutomaton(connectionAutomaton(oneAutomaton("ϵ"), copyAutomaton1), oneAutomaton("ϵ"))
        returnAutomatonLength = length(returnAutomaton)
        beginCopyAutomaton2Length = returnAutomatonLength

        for node in copyAutomaton2
            newNode = []
            for arrow in node
                if :next ∈ keys(arrow)
                    push!(newNode, (next = arrow.next + returnAutomatonLength, value = arrow.value))
                end
            end

            push!(returnAutomaton, newNode)
        end

        pop!(returnAutomaton)
        push!(returnAutomaton[1], (next = beginCopyAutomaton2Length, value = "ϵ"))
        push!(returnAutomaton, [(next = returnAutomatonLength - 1, value = "ϵ")])

        return returnAutomaton
    end

    function transition(currendNode, automaton, value)
        arrows = filter(arrow->arrow.value == value, automaton[currendNode + 1])

        return map(arrow->arrow.next, arrows)
    end

    needepsilontransition(currendNode, automaton) = any(arrow->arrow.value == "ϵ", automaton[currendNode + 1])

    function isaccept(automaton, acceptedNode, values)
    end

    function main()
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
