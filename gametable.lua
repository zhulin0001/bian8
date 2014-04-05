require "base"
require "function"

GameTable = class()

function GameTable:ctor()
    self.cards = {}
end

function GameTable:addCard(card)
    self.cards[#self.cards+1] = card
end

function GameTable:show()
    print('public')
    for i = 1, #self.cards do
        print('第'.. i .. '张牌是：' .. self.cards[i]:description())
    end
    print('')
end

