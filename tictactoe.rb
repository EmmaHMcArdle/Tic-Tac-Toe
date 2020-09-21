class TicTacToe

  def initialize
  @one = "1"
  @two = "2"
  @three = "3"
  @four = "4"
  @five = "5"
  @six = "6"
  @seven = "7"
  @eight = "8"
  @nine = "9"
  @player_num = "one"
  @guess = ""
  @count = 0
  end

  def show_board
  puts "

   #{@one} | #{@two} | #{@three} 
  ___|___|____
   #{@four} | #{@five} | #{@six}
  ___|___|____
   #{@seven} | #{@eight} | #{@nine}  
     |   |    \n"
  puts " "
  end 

  def get_guess()
    #players picks movement
    @guess = gets.chomp.strip
  end

  def guessing(guess = @guess)
    range = [@one, @two, @three, @four, @five, @six, @seven, @eight, @nine]
    if range.include? guess
      @count += 1
      case guess
      when "1"
        @player_num == 'one' ? @one = "O" : @one = "X"      
      when "2"
        @player_num == 'one' ? @two = "O" : @two = "X"    
      when "3"
        @player_num == 'one' ? @three = "O" : @three = "X"    
      when "4"
        @player_num == 'one' ? @four = "O" : @four = "X" 
      when "5"
          @player_num == 'one' ? @five = "O" : @five = "X"    
      when "6"
        @player_num == 'one' ? @six = "O" : @six = "X"   
      when "7"
        @player_num == 'one' ? @seven = "O" : @seven = "X"    
      when "8"
        @player_num == 'one' ? @eight = "O" : @eight = "X"
      when "9"          
        @player_num == 'one' ? @nine = "O" : @nine = "X" 
      else
        puts "You've entered the incorrect input!"  
        get_guess
      end
    else
      puts "That tile is taken already! Please try another tile"
      get_guess
    end
    return @count
  end  

  def change_players
    @player_num == 'one' ? @player_num = 'two' : @player_num = 'one'
    return @player_num
  end

  def check_if_won
    if @one == @two && @one == @three || @one == @four && @one == @seven ||
      @one == @five && @one == @nine || @three == @five && @three == @seven ||
      @two == @five && @two == @eight || @three == @six && @three == @nine ||
      @four == @five && @four == @six || @seven == @eight && @seven == @nine
      puts "Player #{@player_num} won!!!!

     #{@one} | #{@two} | #{@three} 
    ___|___|____
     #{@four} | #{@five} | #{@six}
    ___|___|____
     #{@seven} | #{@eight} | #{@nine}  
       |   |    \n"   
      exit  
    end
    return [@one, @two, @three, @four, @five, @six, @seven, @eight, @nine]
  end
end

class Computer
 def choosePlayer()
    puts "Are you one player or two players?"
    num_of_players = "0"
    until ["one", "two", "1", "2"].any? {|x| num_of_players.include? x }
      num_of_players = gets.chomp
    end
    if num_of_players.include? "one" or num_of_players.include? "1"
      return 1
    else
      return 2
    end 
  end

  def who_goes_first()
    first_turn = ""
    until first_turn == "me" || first_turn == "computer"
      puts "Type 'me' to go first or 'computer' to go second."
      first_turn = gets.chomp.strip
    end
    return first_turn
  end

  def computer_turn(current_board)
    current_board.delete_if { |space| space == "O" || space == "X" }
    return current_board.sample
  end
end

count = 0
cmp = Computer.new
num_of_players = cmp.choosePlayer()
game = TicTacToe.new
puts "New game started... "
if num_of_players == 1
  first_turn = cmp.who_goes_first()
  if first_turn == "me"
    puts "Okay, you will be: O"
    while count < 9
      game.show_board
      game.get_guess
      count = game.guessing
      current_board = game.check_if_won
      cmp_choice = cmp.computer_turn(current_board)
      game.change_players
      count = game.guessing(cmp_choice)
      current_board = game.check_if_won
      game.change_players
    end
  else
    puts "Okay, you will be: X"
    while count < 9
      current_board = game.check_if_won
      cmp_choice = cmp.computer_turn(current_board)
      game.change_players
      count = game.guessing(cmp_choice)
      current_board = game.check_if_won
      game.change_players
      game.show_board
      game.get_guess
      count = game.guessing
      current_board = game.check_if_won
    end
  end

else
  current_player = "one"
  #ask user first tile
  while count < 9
    puts "Player #{current_player}: choose your tile"
    game.show_board
    game.get_guess
    count = game.guessing
    game.check_if_won
    current_player = game.change_players
  end
  puts "There was a tie!"
  exit
end