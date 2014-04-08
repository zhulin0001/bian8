require "base"
require "enum"

Card = class()

function Card:ctor(cardtype, value)
    self.cardtype = cardtype
    self.value = value
end

function Card:cardValue()
    local value = 13*(self.cardtype-1) + self.value
    if self.cardtype == CardTypeBlackJoker then
       value = 53 
   elseif self.cardtype == CardTypeRedJoker then
       value = 54
   end
    return value
end


function Card:description()
    local flag = '未初始化'
    if self.cardtype == CardTypeDiamonds then
        --flag = '方块'--'♦'
        flag = '♦'
    elseif self.cardtype == CardTypeClubs then
        --flag = '梅花'--'♣'
        flag = '♣'
    elseif self.cardtype == CardTypeHearts then
        --flag = '红桃'--'♥'
        flag = '♥'
    elseif self.cardtype == CardTypeSpades then
        --flag = '黑桃'--'♠'
        flag = '♠'
    elseif self.cardtype == CardTypeBlackJoker then
        flag = '小王'
    elseif self.cardtype == CardTypeRedJoker then
        flag = '大王'
    else
        flag = '错误'
    end 
    return  flag .. self.value
end
