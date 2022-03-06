require_relative "player"
require_relative "banker"
require_relative "wager"

attr_reader :wager, :banker, :player

class Baccarat
    def initialize(banker, player, wager)
        @banker, @player, @wager = banker, player, wager
        @stack = {ace: 1, two: 2, three: 3, four: 4, five: 5, six: 6, 
        seven: 7, eight: 8, nine: 9, ten: 10, jack: 10, queen: 10, king: 10}
    end

    def sleep_and_clear
        sleep 1.75
        system ("clear")
        sleep 0.25
    end

    def valid_sides
        ["b", "p"]
    end

    def deal
        card = player.draw_card
        player.drawn_cards << card 
        player.score += @stack[card]

    end

    def run
        puts "Welcomt to Baccarat! Press 'b' for banker and 'p' for player"
        sleep_and_clear
        side = wager.choose_side
        raise "must choose 'b' or 'p'" if !valid_sides.include?(side)
        deal

        
    end


end