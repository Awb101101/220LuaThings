-- Alex Badami
-- Lua Version 5.4

function swap(x, y)
    return y, x
end

hello = swap

print(hello("a", "b"))

-- Outputs b a
