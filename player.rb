class Player 

    attr_accessor :cards

    def initialize
        @cards = ([:ace] * 4) + ([:two] * 4) + ([:three] * 4) + 
        ([:four] * 4) + ([:five] * 4) + ([:six] * 4) + ([:seven] * 4) + 
        ([:eight] * 4) + ([:nine] * 4) + ([:ten] * 4) + ([:jack] * 4) + 
        ([:queen] * 4) + ([:king] * 4)
    end

    def draw_card
        i = rand(52)
        card = @cards.shuffle[i]
        @cards.delete(card)
        card
    end

end