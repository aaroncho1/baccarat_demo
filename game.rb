require_relative "player"
require_relative "banker"
require_relative "wager"

attr_reader :wager, :banker, :player

class Baccarat
    def initialize(banker, player, wager)
        @banker, @player, @wager = banker, player, wager
    end

    def sleep_and_clear
        sleep 1.75
        system ("clear")
        sleep 0.25
    end


    def run
        puts "Welcomt to Baccarat! Press 'b' for banker and 'p' for player"
        sleep_and_clear
        bet = wager.choose_side
        if bet == "b"
            banker.draw_card
        
    end


end