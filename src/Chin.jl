module Chin
    function regexp(string, pattern)
        arrows = Dict()
        currentStatus = 0
        acceptedStatus = 1

        nodeNumber = 0
        for char ∈ split(pattern, "")
            arrows[arrowKey(char, nodeNumber)] = nodeNumber + 1
            nodeNumber += 1
        end

        for char ∈ split(string, "")
            currentArrowkey = arrowKey(char, currentStatus)
            if currentArrowkey ∈ keys(arrows)
                currentStatus = arrows[currentArrowkey]
            else
                break
            end
        end

        return currentStatus == acceptedStatus
    end

    function arrowKey(input, currentStatus)
        string(input, "-", currentStatus)
    end
end
