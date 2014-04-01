require "function"
-- 生成牌
local cards = GenerateCards(54)
-- 洗牌
cards = ShuffleArray_Fisher_Yates(cards, table.getn(cards))
print_lua_table(cards)
