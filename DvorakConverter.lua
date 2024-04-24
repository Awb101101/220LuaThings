-- Alex Badami
-- Using Lua 5.4
-- Dvorak Keyboard Trainer

function useDvorak()
    local index = 1 -- What word in words to type
    words = randomizeTable(readFromFile()) -- Sets the Words Table
    -- A table with keys and values to convert form qwerty to dvorak
    conversionTable = {a = "a", s = "o", d = "e", f = "u", g = "i", h = "d", j = "h", k = "t", l = "n", [";"] = "s"}
    print("Welcome to Dvorak!")
    printKeyboard() -- Prints the keyboard layout
    print(words[index]) -- Prints the current word to be typed
    input = io.read() -- Reads from user input
    while input ~= "EXIT" do -- Exits when the user types EXIT
        dvorak = dvorakConvert(input, conversionTable) -- Converts the input from qwerty to dvorak
        if input == "" then -- Prints the keyboard if the user gives no input
            printKeyboard()
        elseif dvorak == words[index] then -- Checks if the dvorak conversion was equal to the word
            index = index + 1
            print("You typed: " .. dvorak)
            print("Nice!")
        else
            if dvorak == false then -- Checks if the user typed a character not on the home row
                print("You typed an illegal character!")
            else
                print("You typed: " .. dvorak) -- Tells the user what the dvorak was they typed
            end
            print("Try again")
        end
        if words[index] ~= nil then -- If words has a value at the index, print the word
            print(words[index])
            input = io.read()
        else
            input = "EXIT" -- When the words table is empty, end the program
        end
    end
    print("All Done!")
end

-- Converts qwerty text on the home row to dvorak
function dvorakConvert(string, conversionTable)
    local index = 1 -- The letter of the string to convert
    -- Sets output to the conversion of the first letter
    output = conversionTable[string:sub(index, index)]
    -- Stops when we're at the end of the string
    -- The # notation represents the size of the string
    while index < #string do
        index = index + 1
        -- If the key given to the conversion table is ever not a key on the home row,
        -- it will return false
        if conversionTable[string:sub(index, index)] == nil or output == nil then
            return false
        end
        -- Concatenate the former output with the next converted letter
        output = output .. conversionTable[string:sub(index, index)]
    end
    return output
end

-- Makes a table from a list of words read from a file
function readFromFile()
    words = { }
    -- Places each line of 'words.txt' into a table
    for line in io.lines('words.txt') do
        if tableIsEmpty(words) then
            words[1] = line
        else
            words[#words + 1] = line
        end
    end
    return words
end

-- Randomizes the values in a given table
function randomizeTable(inputTable)
    local randomTable = { }
    if inputTable[1] ~= nil then -- If the table is not empty
        for i = 1, #inputTable do -- For each value in the input table
            -- table.inset inserts into a given table, at a given position, the given value
            -- (Note this pushes all other values in randomTable over)
            -- We insert the next index from input table into a random position in random table
            table.insert(randomTable, math.random(#randomTable + 1), inputTable[i])
        end
    end
    return randomTable
end

-- Checks if a table is empty
function tableIsEmpty(table)
    -- This for loop will only run when there is a key value pair in the table
    for _,_ in pairs(table) do
        return false
    end
    return true
end

-- Prints the instructions and the keyboard layout
function printKeyboard()
    print("With your hands in position on the home row, the keyboard layout is:")
    print("a o e u i d h t n s")
    print("Type EXIT to exit")
    print("Press return to see this again")
end

useDvorak()