require "base"

User = class()

function User:ctor(userid)
    self.userid = userid
    self.cards = {}
    self.isActive = false
end

function User:addCard(card)
    self.cards[#self.cards+1] = card
end

function User:isWin()
    local result = false
    if #self.cards == 0 then
        result = true
    end
    return result
end
