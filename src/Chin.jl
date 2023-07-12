module Chin
    function regexp(s, pattern)
        arrows = Dict()
        currentStatus = 0
        acceptedStatus = 1

        nodeNumber = 0
        for char ∈ split(pattern, "")
            arrows[arrowKey(char, nodeNumber)] = nodeNumber + 1
            nodeNumber += 1
        end

        if arrowKey(s, 0) ∈ keys(arrows)
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
