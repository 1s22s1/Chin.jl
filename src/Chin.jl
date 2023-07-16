module Chin
    function matchOne(pattern, text)
        if text == ""
            return false
        end

        if pattern == "."
            return true
        end

        return pattern == text
    end
end
