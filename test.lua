--
--------------------------------------------------------------------------------
--         FILE:  test.lua
--        USAGE:  ./test.lua 
--  DESCRIPTION:  just for test
--      OPTIONS:  ---
-- REQUIREMENTS:  ---
--         BUGS:  ---
--        NOTES:  ---
--       AUTHOR:   (), <>
--      COMPANY:  
--      VERSION:  1.0
--      CREATED:  2014/4/6 1:06:42 中国标准时间
--     REVISION:  ---
--------------------------------------------------------------------------------
--
--
local cards = {1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7}

    local MAX_CARD_IN_A_ROW = 8
    local maxRow = math.modf(#cards/MAX_CARD_IN_A_ROW)
    local minColumn = #cards % MAX_CARD_IN_A_ROW
    print('max ' .. maxRow .. ' min ' .. minColumn .. ' count ' .. #cards .. ' cards ' .. MAX_CARD_IN_A_ROW)
    
    local output = ''
    for i = 0, maxRow do
        for j = 1, MAX_CARD_IN_A_ROW do
            if i*MAX_CARD_IN_A_ROW+j <= #cards then
                output = output .. cards[i*MAX_CARD_IN_A_ROW + j] .. '\t'
            else
                break
            end
        end
        if i < maxRow then
            output = output .. '\n'
        end
    end
    print(output)

