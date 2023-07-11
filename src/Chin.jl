module Chin
    function regexp(s, pattern)
        currentStatus = 0
        acceptedStatus = 1

        arrows = Dict("a" => 1)

        if haskey(arrows, s)
            currentStatus = arrows[s]
        end

        return currentStatus == acceptedStatus
    end
end
