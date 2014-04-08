require "base"
require "function"

CardShoes = class()

function CardShoes:ctor(cards)
    self.cards = cards
    self.dropedCards = {}
end

function CardShoes:getCard()
    local card = nil
    if #self.cards == 0 then
        self:resetCards()
        if #self.cards == 0 then
            print('ERROR: No Card!')
        end
    end
    card = self.cards[1]
    table.remove(self.cards, 1)
    return card
end

function CardShoes:resetCards()
    if #self.dropedCards > 0 then
        self.cards = ShuffleArray_Fisher_Yates(self.dropedCards, #self.dropedCards)
        self.dropedCards = {}
    else
        print('ERROR: No Droped Cards')
    end
end

function CardShoes:addDropedCard(card)
    table.insert(self.dropedCards, card)
end

