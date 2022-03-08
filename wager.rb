class Wager  
    attr_reader :name
    attr_accessor :balance

    def initialize(name, balance)
        @name, @balance = name, balance
    end

    def choose_side
        "Enter 'p' for player or 'b' for banker:"
        side = gets.chomp
        side
    end

    def risk_amount
        puts "Enter your risk amount:"
        amount = gets.chomp.to_i
        amount  
    end


end