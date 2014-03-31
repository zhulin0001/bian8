require "base"
require "enum"

Card = class()

function Card:ctor()
    self.cardtype = 0 
    self.value = 0 
end

function Card:ctor(cardtype, value)
    self.cardtype = cardtype
    self.value = value
    print('type ' .. self.cardtype .. ' value ' .. self.value)
end

--[[
function Card:ctor(joker)
    self.cardtype = joker 
    self.value = 0 
end
]]

function Card:cardValue()
    return 13*(self.cardtype-1) + self.value
end

function Card:description()
    local flag = '未初始化'
    if self.cardtype == CardTypeDiamonds then
        flag = '方块'--'♦'
    elseif self.cardtype == CardTypeClubs then
        flag = '梅花'--'♣'
    elseif self.cardtype == CardTypeHearts then
        flag = '红桃'--'♥'
    elseif self.cardtype == CardTypeSpades then
        flag = '黑桃'--'♠'
    elseif self.cardtype == CardTypeBlackJoker then
        flag = '小王'
    elseif self.cardtype == CardTypeRedJoker then
        flag = '大王'
    else
        flag = '错误'
    end 
    return  flag .. self.value
end
