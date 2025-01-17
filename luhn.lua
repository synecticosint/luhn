-- Disclaimer
print("Disclaimer: Using this code for nefarious purposes, such as fraudulent activities, is illegal and punishable by law. Use responsibly.")

-- Function to validate a number using Luhn's algorithm
function luhn_check(number)
    local digits = {}
    for d in string.gmatch(tostring(number), "%d") do
        table.insert(digits, tonumber(d))
    end

    local checksum = 0
    -- Loop through all digits from right to left
    for i = #digits, 1, -1 do
        local digit = digits[i]
        -- Double every second digit from the right
        if (#digits - i + 1) % 2 == 0 then  
            digit = digit * 2
            if digit > 9 then
                digit = digit - 9
            end
        end
        checksum = checksum + digit
    end

    -- If the total modulo 10 is 0, the number is valid
    return checksum % 10 == 0
end

-- Function to confirm if a number is correct
function confirm_number(number)
    local input
    repeat
        print("Please confirm if '" .. number .. "' is correct (yes/no):")
        input = io.read():lower()
    until input == "yes" or input == "no"
    return input == "yes"
end

-- Main execution
local test_number = "4532015112830366"  -- Example Visa card number
if confirm_number(test_number) then
    if luhn_check(test_number) then
        print("The number is valid according to Luhn's algorithm.")
    else
        print("The number is not valid according to Luhn's algorithm.")
    end
else
    print("Number confirmation failed. Process terminated.")
end
