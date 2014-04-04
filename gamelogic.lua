require "function"
require "global"
require "user"
require "cardshoes"
-- 生成牌
local cards = GenerateCards( 54 * CARD_DECKS )
-- 洗牌
cards = ShuffleArray_Fisher_Yates(cards, table.getn(cards))
--创建玩家
local users = {}
for i = 1, MAX_USER do
    users[i] = User.new(i)
end
local cardShoe = CardShoes.new(cards)
DealCards(users, cardShoe)
print_lua_table(users)
