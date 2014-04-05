require "base"

User = class()

function User:ctor(userid)
    self.userid = userid
    self.cards = {}
    self.isActive = false
end

function User:addCard(card)
    self.cards[#self.cards+1] = card
    print('玩家 ' .. self.userid .. ' 获得牌：' .. card:description())
    print('玩家 ' .. self.userid .. ' 的手牌是：')
    self:showCards()
end

function User:showCards()
    for i = 1, #self.cards do
        print('第'.. i .. '张牌是：' .. self.cards[i]:description())
    end
end

function User:isWin()
    local result = false
    if #self.cards == 0 then
        result = true
    end
    return result
end

function User:dropCard(cardID)
    local card = self.cards[cardID]
    for i = cardID, #self.cards do
        if self.cards[i] ~= nil then
            self.cards[i] = self.cards[i+1]
        end
    end
    print('UserID: ' .. self.userid .. ' drop: ' .. card:description())
    self:showCards()
    return card
end
