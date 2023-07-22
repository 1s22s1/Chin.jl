module Chin
    using Printf

    function oneAutomaton(character)
        automaton = []

        push!(automaton, [(next = length(automaton) + 1, value = character)])
        push!(automaton, [()])
    end

    function connectionAutomaton(automaton1, automaton2)
        copyAutomaton1 = deepcopy(automaton1)
        copyAutomaton2 = deepcopy(automaton2)

        for i in eachindex(copyAutomaton2)
            newArrows = []

            for j in eachindex(copyAutomaton2[i])
                if :next ∈ keys(copyAutomaton2[i][j])
                    push!(newArrows, (next = copyAutomaton2[i][j].next + length(copyAutomaton1) - 1, value = copyAutomaton2[i][j].value))
                else
                    push!(newArrows, [()])
                end
            end

            if i == 1 
                copyAutomaton1[1] = [copyAutomaton1[1] newArrows]
            elseif i == length(copyAutomaton2)
                break
            else
                push!(copyAutomaton1, newArrows)
            end
        end

        return copyAutomaton1
    end

    function selectionAutomaton(automaton1, automaton2)
        true
    end

    function main()
        sAutomaton = oneAutomaton("s")
        tAutomaton = oneAutomaton("t")

        copyAutomaton1 = deepcopy(sAutomaton)
        copyAutomaton2 = deepcopy(tAutomaton)

        for i in eachindex(copyAutomaton2)
            newArrows = []

            for j in eachindex(copyAutomaton2[i])
                if :next ∈ keys(copyAutomaton2[i][j])
                    push!(newArrows, (next = copyAutomaton2[i][j].next + length(copyAutomaton1) - 1, value = copyAutomaton2[i][j].value))
                else
                    push!(newArrows, [()])
                end
            end

            if i == 1 
                copyAutomaton1[1] = [copyAutomaton1[1] newArrows]
            elseif i == length(copyAutomaton2)
                break
            else
                push!(copyAutomaton1, newArrows)
            end
        end

        # [[(next = 1, value = "s")], [(next = 2, value = "t")], [()]]
        @printf("copyAutomaton1=%s\n", string(copyAutomaton1))
        @printf("copyAutomaton2=%s\n", string(copyAutomaton2))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
