class GuessingGame
    attr_reader :num_attempts
    def initialize(min, max) 
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0 
        @game_over = false
    end

    def game_over?
        @game_over
    end 

    def check_num(num)
        @num_attempts += 1 
        if num == @secret_num 
            @game_over = true
        end 
        if num == @secret_num
            print "you win"
        end
        if num > @secret_num
            print "too big"
        end
        if num < @secret_num
            print "too small"
        end
    end
    def ask_user
        print "enter a number"
        input = gets.chomp.to_i 
        check_num(input)
    end 
end

        
