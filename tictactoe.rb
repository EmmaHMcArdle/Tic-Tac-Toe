class TicTacToe

  def initialize
  @board = [["1","2","3"],
            ["4","5","6"],
            ["7","8","9"]]
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
  
  #players picks movement
  #def playerChoice
  #end

  def beginning
  #ask user first tile
  puts "New game started... 
  Player #{@playerNum}: choose your tile
   #{@one} | #{@two} | #{@three} 
  ___|___|____
   #{@four} | #{@five} | #{@six}
  ___|___|____
   #{@seven} | #{@eight} | #{@nine}  
     |   |    \n"
  @guess = gets.chomp
  guessing
  end 

  def guessing
    case @guess
    when "1"
      if @one == "1"
        @playerNum == 'one' ? @one = "0" : @one = "X"   
        fillInBoard
      else
        taken
      end       
    when "2"
      if @two == "2"
        @playerNum == 'one' ? @two = "0" : @two = "X"   
        fillInBoard
      else
        taken
      end
    when "3"
      if @three == "3"
        @playerNum == 'one' ? @three = "0" : @three = "X"   
        fillInBoard
      else
        taken
      end
    when "4"
      if @four == "4"
        @playerNum == 'one' ? @four = "0" : @four = "X"   
        fillInBoard
      else
        taken
      end
    when "5"
      if @five == "5"
        @playerNum == 'one' ? @five = "0" : @five = "X"   
        fillInBoard
      else
        taken
      end
    when "6"
      if @six == "6"
        @playerNum == 'one' ? @six = "0" : @six = "X"   
        fillInBoard
      else
        taken
      end
    when "7"
      if @seven == "7"
        @playerNum == 'one' ? @seven = "0" : @seven = "X"   
        fillInBoard
      else
        taken
      end
    when "8"
      if @eight == "8"
        @playerNum == 'one' ? @eight = "0" : @eight = "X"   
        fillInBoard
      else
        taken
      end
    when "9"          
      if @nine == "9"
        @playerNum == 'one' ? @nine = "0" : @nine = "X"   
        fillInBoard
      else
        taken
      end
    else
      puts "You've entered the incorrect input!"  
      changePlayers
      fillInBoard
    end
  end  

  def changePlayers
    if @playerNum == 'one'
      @playerNum = 'two'
    else
      @playerNum = 'one'
    end 
  end

  def taken
    puts "That tile is taken already! Please try another time"
    changePlayers
    fillInBoard
  end

  def fillInBoard
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
    elsif @count == 9
      puts "There was a tie!"
      exit  
    else 
    @count += 1 
    puts "#{@count}" 
    changePlayers   
    puts "Player #{@playerNum}: Choose your tile
     #{@one} | #{@two} | #{@three} 
    ___|___|____
     #{@four} | #{@five} | #{@six}
    ___|___|____
     #{@seven} | #{@eight} | #{@nine}  
       |   |    \n"
    @guess = gets.chomp
    guessing
    end
  end  

  game = TicTacToe.new
  game.beginning

end