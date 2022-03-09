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
        @card_outcomes = []
    end

    def valid_sides
        ["b", "p"]
    end

    def player_banker_draw_cards
        player_card = player.draw_card
        @card_outcomes << player_card
        banker_card = banker.draw_card
        @card_outcomes << banker_card
    end

    def deal
        2.times do 
            player_banker_draw_cards
        end
        player_banker_draw_cards if player.real_score < 8 && banker.real_score < 8
    end

    def result 
        if player.real_score > banker.real_score
            "p"
        elsif banker.real_score > player.real_score
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
            unless tie?
                wager.balance -= risk_amount
                puts "bet lost" 
            end
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
        puts "Game over. Your cashout balance is $#{wager.balance}.00"
    end

    def run
        debugger
        system("clear")
        puts "Welcome to Baccarat!"
        # sleep 1.5
        until game_over
            system("clear")
            begin
                risk = wager.risk_amount
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
            game_reset
        end
        game_over_message
    end

    def game_reset
        player.drawn_cards = []
        banker.drawn_cards = []
        player.score = 0
        banker.score = 0
        @card_outcomes = []
    end
end

Baccarat.new((Banker.new("banker", 0)), (Player.new("player", 0)), Wager.new("Aaron", 0)).run