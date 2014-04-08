require "base"
require "function"

CardShoes = class()

function CardShoes:ctor(cards)
    self.cards = cards
    self.index = 1
    self.dropedCards = {}
end

function CardShoes:getCard()
    local card = self.cards[self.index]
    self.index = self.index + 1
    if self.index > #self.cards then
        self.cards = ShuffleArray_Fisher_Yates(self.cards)
        self.index = 0
    end
    return card
end

function CardShoes:resetCards()

end
