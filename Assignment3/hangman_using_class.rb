#Design a HANGMAN game using classes and objects


## Problem faced---------

# Defining a global variable (Not recommended)
# Passing object of Begin to play_game ---- @ , @@, CONSTANT    
# Return type of initialize (The constructor will have no return type and will write some values like the status is true/false #<Play_game:0x000076bcf3aea480> ) 
# So it cannot be directly used to check the current boolean state of the game hence created 'play' method











class Begin
    attr_accessor :word, :length, :hint, :remaining_chars, :guessed_chars, :incorrect_chars, :tries
  
    def initialize(level, decide_level)
      if decide_level.key?(level)
        puts "Your level is #{level}"
        word_data = decide_level[level].sample
  
        
        @word = word_data[:word]
        @hint = word_data[:hint]
        @length = @word.length
        @remaining_chars = @word.length
        @guessed_chars = []
        @incorrect_chars = []
        @tries = 5
      else
        puts 'Wrong input level, try again'
      end
    end
end
  
decide_level = {
    1 => [
      { word: 'house', hint: 'The place where a person lives' },
      { word: 'tree', hint: 'A tall plant with a trunk and branches' },
      { word: 'frog', hint: 'A small amphibian that hops' }
    ],
    2 => [
      { word: 'curd', hint: 'A dairy product made from milk' },
      { word: 'rock', hint: 'A solid mineral material' },
      { word: 'milk', hint: 'A white liquid produced by mammals' }
    ],
    3 => [
      { word: 'blue', hint: 'The color of the sky' },
      { word: 'fire', hint: 'A combustion that produces heat and light' },
      { word: 'lion', hint: 'The king of the jungle' }
    ],
    4 => [
      { word: 'maze', hint: 'A network of paths and hedges' },
      { word: 'clay', hint: 'A natural earthy material' },
      { word: 'coal', hint: 'A combustible black rock' }
    ],
    5 => [
      { word: 'void', hint: 'A completely empty space' },
      { word: 'zest', hint: 'Great enthusiasm and energy' },
      { word: 'knot', hint: 'A fastening made by tying' }
    ]
}
  
class Play_game
    def initialize(game_state)
      @game_state = game_state
    end
  
    def play
      puts "READY TO ROCKSSS?!!.. LET'S BEGIN"
      puts "Hint: #{@game_state.hint}"
      puts "The length of the guessing word is: #{@game_state.length}"
  
      while @game_state.tries.positive?
        puts "You have #{@game_state.tries} tries left"
        puts 'Enter a character:'
        in_char = gets.chomp.downcase
        puts "Your entered char is: #{in_char}"
  
        if valid_character?(in_char)
          process_guess(in_char)
  
          if @game_state.remaining_chars.zero?
            puts '🎉 WELL DONE!!! YOU HAVE GUESSED THE WORD! 🎉'
            puts "The word was: #{@game_state.word}"
            return true  # ✅ Player won
          end
        else
          puts 'Char entered by you is invalid... try again'
        end
  
        # ✅ Check if player lost
        if @game_state.tries.zero?
          puts '💀 SOOOO SOOOOOOOOOOOOORY!!! YOU LOST!! 💀'
          puts "The correct word was: #{@game_state.word}"
          return false  # ✅ Return false when player loses
        end
      end
    end
  
    private
  
    def valid_character?(char)
      char.length == 1 && char.match?(/[a-zA-Z]/)
    end
  
    def process_guess(char)
      if @game_state.word.include?(char)
        if @game_state.guessed_chars.include?(char)
          puts '⚠️ This char already exists!!'
        else
          @game_state.guessed_chars << char
          count = @game_state.word.count(char)
          @game_state.remaining_chars -= count
  
          puts "✅ Great! You have guessed #{count} char(s)! REMAINING CHARS: #{@game_state.remaining_chars}"
          positions = @game_state.word.enum_for(:scan, /#{char}/).map { Regexp.last_match.begin(0) + 1 }
          puts "🔎 The positions of #{char} are: #{positions.join(', ')}"
        end
      else
        process_incorrect_guess(char)
      end
    end
  
    def process_incorrect_guess(char)
      if @game_state.incorrect_chars.include?(char)
        puts '⚠️ Already tried this character!'
      else
        @game_state.tries -= 1
        @game_state.incorrect_chars << char
        puts '❌ Oops! Entered char is not in the guessing word...'
      end
    end
  end




  
  current_level = 1
  loop do
    game_state = Begin.new(current_level, decide_level)
    game = Play_game.new(game_state)
  
    game_won = game.play  
  
    break unless game_won  
  
    if current_level < 5
      puts "🎯 Do you want to proceed to level #{current_level + 1}? (yes/no)"
      response = gets.chomp.downcase
      break unless response == 'yes'
  
      current_level += 1
    else
      puts "🏆 Congratulations! You've completed all levels! 🏆"
      break
    end
  end
  