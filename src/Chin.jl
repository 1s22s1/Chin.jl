module Chin
    struct Arrow
        fromNode::Int
        toNode::Int
        arrowValue::String
    end

    function matchOneAutomaton(string)
        Arrow(0, 1, string)
    end
    # function regexp(string, pattern, actionPattern="connection")
    #     if actionPattern == "connection"
    #         return connectionRegexp(string, pattern)
    #     else
    #         return selectRegexp(string, pattern)
    #     end
    # end

    # function connectionRegexp(string, pattern)
    #     if length(string) == 0
    #         return true
    #     end

    #     currentStatus = 0
    #     arrows = makeConnectionArrows(pattern)
    #     acceptedStatus = length(pattern)

    #     for char ∈ split(string, "")
    #         currentArrowkey = arrowKey(currentStatus, char)
            
    #         if currentArrowkey ∈ keys(arrows)
    #             currentStatus = arrows[currentArrowkey]
    #         else
    #             break
    #         end
    #     end

    #     return currentStatus == acceptedStatus
    # end

    # function makeConnectionArrows(pattern)
    #     nodeNumber = 0
    #     arrows = Dict()

    #     for char ∈ split(pattern, "")
    #         arrows[arrowKey(nodeNumber, char)] = nodeNumber + 1
    #         nodeNumber += 1
    #     end

    #     return arrows
    # end

    # function selectRegexp(string, pattern)
    #     if length(string) == 0
    #         return true
    #     end

    #     currentStatus = 0
    #     arrows = makeSelectArrows(pattern)
    #     acceptedStatus = 1

    #     if arrowKey(0, string) ∈ keys(arrows)
    #         currentStatus = 1
    #     end

    #     return currentStatus == acceptedStatus
    # end

    # function makeSelectArrows(pattern)
    #     arrows = Dict()

    #     for char ∈ split(pattern, '|')
    #         arrows[arrowKey(0, char)] = 1
    #     end

    #     return arrows
    # end

    # arrowKey(currentStatus, input) = string(currentStatus, "-", input)
end
