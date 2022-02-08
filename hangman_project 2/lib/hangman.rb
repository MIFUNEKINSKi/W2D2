class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    def self.random_word
      DICTIONARY.sample
    end 


    
    def initialize
      # because it's outside the clas scope
      @secret_word = Hangman.random_word 
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = Array.new
      @remaining_incorrect_guesses = 5
      end 

      def guess_word
        @guess_word
      end 
       def attempted_chars 
        @attempted_chars
      end 
       def remaining_incorrect_guesses
        @remaining_incorrect_guesses
      end 
       def already_attempted?(char)
          attempted_chars.include?(char)
      end 
  
      def get_matching_indices(char)
          indices = []
         @secret_word.each_char.with_index do |c,idx|
            if c == char
            indices << idx
            end
          end 
          return indices
      end 

      def fill_indices(char,arr)
        arr.each_with_index do |ele|
          guess_word[ele] = char
        end
      end 

      def try_guess(char)
          if already_attempted?(char)
            print "that has already been attempted"
            return false
          end
  
          attempted_chars.push(char)
          

         
          matching_indices = self.get_matching_indices(char)
          if matching_indices.empty?
            @remaining_incorrect_guesses -= 1
          else
            self.fill_indices(char, matching_indices)
          end
          true
      end 
    
      def ask_user_for_guess
        print "Enter a char:"
        char=gets.chomp
        try_guess(char)
      end 

        def win?
          if guess_word.join("") == @secret_word
            print "WIN"
          true
          else 
            false
          end 
      end 

      def lose?
        if remaining_incorrect_guesses == 0 
          print "LOSE"
          true
        else
          false
        end 
      end 

      def game_over?  
        if win? || lose?
        print "The secret word was: " + @secret_word
        true
      else
         false
      end 
    end

     

end
