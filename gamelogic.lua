require "function"
require "global"
require "user"
require "cardshoes"
require "gametable"

-- 生成牌
local cards = GenerateCards( 54 * CARD_DECKS )
-- 洗牌
cards = ShuffleArray_Fisher_Yates(cards, table.getn(cards))
--创建玩家
local users = {}
for i = 1, MAX_USER do
    users[i] = User.new(i)
end
--创建牌堆
local cardShoe = CardShoes.new(cards)
--创建牌桌
local cardTable = GameTable.new()
--开始游戏
StartGame(users, cardShoe, cardTable)
