module Chin
    function regexp(string, pattern)
        currentStatus = 0
        arrows = makeArrows(pattern)

        acceptedStatus = length(string)
        for char ∈ split(string, "")
            currentArrowkey = arrowKey(currentStatus, char)
            
            if currentArrowkey ∈ keys(arrows)
                currentStatus = arrows[currentArrowkey]
            else
                break
            end
        end

        return currentStatus == acceptedStatus
    end

    function makeArrows(pattern)
        nodeNumber = 0
        arrows = Dict()

        for char ∈ split(pattern, "")
            arrows[arrowKey(nodeNumber, char)] = nodeNumber + 1
            nodeNumber += 1
        end

        return arrows
    end

    function arrowKey(currentStatus, input)
        string(currentStatus, "-", input)
    end
end
