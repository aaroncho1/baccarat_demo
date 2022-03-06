require_relative "cards"
require_relative "wager"

class Baccarat
    def initialize(banker, player, wager)
        @banker, @player, @gambler
    end

    def sleep_and_clear
        sleep 1.75
        system ("clear")
        sleep 0.25
    end

    def place_wager


    def run
        puts "Welcomt to Baccarat! Press 'b' for banker and 'p' for player"
        sleep_and_clear
        place_wager
    end


end