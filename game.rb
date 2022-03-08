require_relative "player"
require_relative "banker"
require_relative "wager"
require 'byebug'

attr_reader :wager, :banker, :player
attr_accessor :game_over

class Baccarat
    def initialize(banker, player, wager)
        @banker, @player, @wager = banker, player, wager
        @stack = {ace: 1, two: 2, three: 3, four: 4, five: 5, six: 6, 
        seven: 7, eight: 8, nine: 9, ten: 10, jack: 10, queen: 10, king: 10}
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
        player_banker_draw_cards if player.score >= 8 || banker.score >= 8
    end

    def winner 
        winning_side = player.score > banker.score ? "p" : "b"
        winning_side
    end

    def settle_wager(risk_amount, side)
        if side == winner
            wager.balance += risk_amount
            puts "bet won"
        else
            wager.balance -= risk_amount
            puts "bet lost"
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
        puts "Welcomt to Baccarat! Press 'b' for banker and 'p' for player"
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
            replay?
        end
        game_over_message
    end
end

Game.new((Banker.new("banker")), (Player.new("player")), Wager.new("Aaron", 0))).run