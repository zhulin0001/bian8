require "base"
require "function"

GameTable = class()

function GameTable:ctor()
    self.topCard = nil
end

function GameTable:addCard(card)
    local oldCard = self.topCard
    self.topCard = card
    return oldCard
end

function GameTable:show()
    print('Public: 当前牌是：' .. self.topCard:description() .. '\n')
end

