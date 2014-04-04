require "base"

CardShoes = class()

function CardShoes:ctor(cards)
    self.cards = cards
    self.index = 1
end

function CardShoes:getCard()
    local card = self.cards[index]
    index = index + 1
    return card
end

function CardShoes:resetCards()

end
