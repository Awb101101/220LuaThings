-- Simple Calculator Class
SimpleCalculator = {}

function SimpleCalculator:new()
    local t = setmetatable({}, {__index = SimpleCalculator})
end

-- Note that Lua doesn't require a specific amount of arguments
function SimpleCalculator:addition(...)
    args = {...}
    output = 0
    for _, val in pairs(args) do
        output = output + val
    end
    return output
end

function SimpleCalculator:subtraction(...)
    args = {...}
    output = 0
    for num, val in pairs(args) do
        if num == 1 then
            output = val
        else
            output = output - val
        end
    end
    return output
end

function SimpleCalculator:multiplication(...)
    args = {...}
    output = 0
    for _, val in pairs(args) do
        output = output * val
    end
end

function SimpleCalculator:division(...)
    args = {...}
    output = 0
    for num, val in pairs(args) do
        if num == 1 then
            output = val
        else
            output = output / val
        end
    end
    return output
end

calc = SimpleCalculator

print(calc:addition(calc:subtraction(9, 4), calc:multiplication(8, 9, 3), calc:division(calc:addition(9, 9), 3)))