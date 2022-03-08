class Banker  

    attr_accessor :cards, :drawn_cards, :score

    def initialize(name)
        @name = name
        @cards = ([:ace] * 4) + ([:two] * 4) + ([:three] * 4) + 
        ([:four] * 4) + ([:five] * 4) + ([:six] * 4) + ([:seven] * 4) + 
        ([:eight] * 4) + ([:nine] * 4) + ([:ten] * 4) + ([:jack] * 4) + 
        ([:queen] * 4) + ([:king] * 4)
        @drawn_cards = []
        @score = 0
    end

    def draw_card
        i = rand(52)
        card = @cards.shuffle[i]
        puts "#{card}"
        @cards.delete(card)
        drawn_cards << banker_card
        score += @stack[banker_card]
        card
    end

end