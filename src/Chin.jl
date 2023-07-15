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

    function match(pattern, text)
        if pattern == ""
            return true
        else
            return matchOne(pattern[1], text[1]) && match(pattern[2:length(pattern)], text[2:length(text)])
        end

    end
end
