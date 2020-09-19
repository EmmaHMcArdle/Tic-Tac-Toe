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
  @playerNum = "one";
  @guess = "";
  @count = 0;
  end

  def show_board
  #ask user first tile
  puts "Player #{@playerNum}: choose your tile

   #{@one} | #{@two} | #{@three} 
  ___|___|____
   #{@four} | #{@five} | #{@six}
  ___|___|____
   #{@seven} | #{@eight} | #{@nine}  
     |   |    \n"
  puts " "
  #players picks movement
  @guess = gets.chomp.strip
  end 

  def guessing
    range = [@one, @two, @three, @four, @five, @six, @seven, @eight, @nine]
    if range.include? @guess
      @count += 1
      case @guess
      when "1"
        @playerNum == 'one' ? @one = "0" : @one = "X"      
      when "2"
        @playerNum == 'one' ? @two = "0" : @two = "X"    
      when "3"
        @playerNum == 'one' ? @three = "0" : @three = "X"    
      when "4"
        @playerNum == 'one' ? @four = "0" : @four = "X" 
      when "5"
          @playerNum == 'one' ? @five = "0" : @five = "X"    
      when "6"
        @playerNum == 'one' ? @six = "0" : @six = "X"   
      when "7"
        @playerNum == 'one' ? @seven = "0" : @seven = "X"    
      when "8"
        @playerNum == 'one' ? @eight = "0" : @eight = "X"
      when "9"          
        @playerNum == 'one' ? @nine = "0" : @nine = "X" 
      else
        puts "You've entered the incorrect input!"  
        show_board
      end
    else
      puts "That tile is taken already! Please try another tile"
      show_board
    end
    return @count
  end  

  def change_players
    @playerNum == 'one' ? @playerNum = 'two' : @playerNum = 'one'
  end

  def check_if_won
    if @one == @two && @one == @three || @one == @four && @one == @seven ||
      @one == @five && @one == @nine || @three == @five && @three == @seven ||
      @two == @five && @two == @eight || @three == @six && @three == @nine ||
      @four == @five && @four == @six || @seven == @eight && @seven == @nine
      puts "Player #{@playerNum} won!!!!
     #{@one} | #{@two} | #{@three} 
    ___|___|____
     #{@four} | #{@five} | #{@six}
    ___|___|____
     #{@seven} | #{@eight} | #{@nine}  
       |   |    \n"     
    end
  end  

end


game = TicTacToe.new
puts "New game started... "
count = 0
while count < 9
  game.show_board
  count = game.guessing
  game.check_if_won
  game.change_players
end
puts "There was a tie!"
exit