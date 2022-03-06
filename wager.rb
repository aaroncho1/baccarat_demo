class Wager  

    attr_accessor :balance, :budget

    attr_accessor :balance, :budget
    def initialize(balance, budget)
        @balance, @budget = balance, budget
    end

    def choose_side
        side = gets.chomp
        side
    end

end