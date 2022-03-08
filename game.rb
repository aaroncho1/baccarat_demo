require_relative "player"
require_relative "banker"
require_relative "wager"
require 'byebug'

class Baccarat
    attr_reader :wager, :banker, :player
    attr_accessor :game_over

    def initialize(banker, player, wager)
        @banker, @player, @wager = banker, player, wager
        @game_over = false
    end

    def sleep_and_clear
        sleep 1.75
        system ("clear")
        sleep 0.25
    end

    def valid_sides
        ["b", "p"]
    end

    def player_banker_draw_cards
        player_card = player.draw_card
        banker_card = banker.draw_card
    end

    def deal
        2.times do 
            player_banker_draw_cards
        end
        player_banker_draw_cards if player.real_score < 8 || banker.real_score < 8
    end

    def result 
        if player.score > banker.score
            "p"
        elsif banker.score > player.score
            "b"
        else
            "t"
        end
    end

    def tie?
        result == "t"
    end

    def settle_wager(risk_amount, side)
        if side == result
            wager.balance += risk_amount
            puts "bet won"
        else
            wager.balance -= risk_amount
            puts "bet lost" unless tie?
        end
    end

    def replay?
        puts "bet again? (y/n)"
        rebet = gets.chomp
        if rebet == "n"
            @game_over = true
        end
    end

    def game_over_message
        puts "Game over. Your remaining balance is #{wager.balance}"
    end

    def run
        debugger
        puts "Welcome to Baccarat! Press 'b' for banker and 'p' for player"
        until game_over
            sleep_and_clear
            risk = wager.risk_amount
            begin
                side = wager.choose_side
                raise "must choose 'b' or 'p'" if !valid_sides.include?(side)
            rescue => e    
                puts e.message
                retry
            end
            deal
            settle_wager(risk, side)
            puts "It's a tie!" if tie?
            replay?
        end
        game_over_message
    end
end

Baccarat.new((Banker.new("banker", 0)), (Player.new("player", 0)), Wager.new("Aaron", 0)).run