module Chin
    function regexp(s, pattern)
        arrows = Dict()
        currentStatus = 0
        acceptedStatus = 1

        for char in split(pattern, "")
            arrows[arrowKey(char, 0)] = 1
        end

        if haskey(arrows, arrowKey(s, 0))
            currentStatus = arrows[arrowKey(s, 0)]
        else
            return false
        end

        return currentStatus == acceptedStatus
    end

    function arrowKey(input, currentStatus)
        string(input, "-", currentStatus)
    end
end
