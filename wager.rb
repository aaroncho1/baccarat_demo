class Wager  
    attr_reader :name
    attr_accessor :balance

    def initialize(name, balance)
        @name, @balance = name, balance
    end

    def choose_side
        puts "Enter 'p' for player or 'b' for banker:"
        side = gets.chomp
        side
    end

    def risk_amount
        puts "Enter your risk amount:"
        amount = gets.chomp
        raise "amount should be in whole dollars" if amount.include?(".")
        amount.each_char do |char|
            raise "please use only numbers" if !(0..10).to_a.join("").include?(char)
        end    
        wager = amount.to_i  
        wager
    end
end

