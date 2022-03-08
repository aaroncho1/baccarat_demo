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
        @stack = {ace: 1, two: 2, three: 3, four: 4, five: 5, six: 6, 
        seven: 7, eight: 8, nine: 9, ten: 10, jack: 10, queen: 10, king: 10}
    end

    def draw_card
        card = @cards.shuffle.pop
        puts "#{card}"
        drawn_cards << card 
        score += @stack[card]
        card
    end

end

