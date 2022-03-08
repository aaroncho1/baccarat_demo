class Wager  
    attr_reader :name
    attr_accessor :balance

    def initialize(name, balance)
        @name, @balance = name, balance
    end

    def choose_side
        side = gets.chomp
        side
    end

    def risk_amount
        amount = gets.chomp.to_i
        amount  
    end


end