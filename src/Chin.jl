module Chin
    function regexp(string, pattern, actionPattern="connection")
        return connectionRegexp(string, pattern)
    end

    function connectionRegexp(string, pattern)
        currentStatus = 0
        arrows = makeConnectionArrows(pattern)
        acceptedStatus = length(pattern)

        if length(string) == 0
            return true
        end

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

    function selectRegexp(string, pattern)
        return true
    end

    function makeConnectionArrows(pattern)
        nodeNumber = 0
        arrows = Dict()

        for char ∈ split(pattern, "")
            arrows[arrowKey(nodeNumber, char)] = nodeNumber + 1
            nodeNumber += 1
        end

        return arrows
    end

    arrowKey(currentStatus, input) = string(currentStatus, "-", input)
end
