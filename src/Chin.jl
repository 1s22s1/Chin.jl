module Chin
    # using Printf

    function oneAutomaton(character)
        graph = []

        push!(graph, Dict(:next => length(graph) + 1, :value => character))
        push!(graph, Dict())
    end

    function connectionAutomaton(s, t)
        map(d->  d[:next] = d[:next] + length(s) - 1, filter(d->:next ∈ keys(d), t))
        s[end] = merge(s[end], t[begin])

        [s; t[begin + 1 : end]]
    end

    function main()
        # graph = []

        # s = [Dict(:next => 1, :value => "s"), Dict()]
        # t = [Dict(:next => 1, :value => "t"), Dict()]

        # map(d->  d[:next] = d[:next] + length(s) - 1, filter(d->:next ∈ keys(d), t))

        # s[end] = merge(s[end], t[begin])
        # graph = [s; t[begin + 1 : end]]

        # @printf("A=%s\n", string(graph))
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    using .Chin

    Chin.main()
end
