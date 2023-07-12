module Chin
    function regexp(s, pattern)
        arrows = Dict()
        currentStatus = 0
        acceptedStatus = 1

        for char in split(pattern, "")
            arrows[char] = 1
        end

        if haskey(arrows, s)
            currentStatus = arrows[s]
        else
            return false
        end

        return currentStatus == acceptedStatus
    end
end
