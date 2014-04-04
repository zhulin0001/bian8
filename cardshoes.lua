require "base"

CardShoes = class()

function CardShoes:ctor(cards)
    self.cards = cards
    self.index = 1
end

function CardShoes:getCard()
    local card = self.cards[self.index]
    self.index = self.index + 1
    return card
end

function CardShoes:resetCards()

end
