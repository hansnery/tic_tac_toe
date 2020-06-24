class TicTacToe

  def initialize
    @line_1 = [" "," ", " "]
    @line_2 = [" "," ", " "]
    @line_3 = [" "," ", " "]
    
    print_board
    play
  end

  def print_board
    puts "   a     b     c
      |     |     
1  #{@line_1[0]}  |  #{@line_1[1]}  |  #{@line_1[2]}  
 _____|_____|_____
      |     |     
2  #{@line_2[0]}  |  #{@line_2[1]}  |  #{@line_2[2]}  
 _____|_____|_____
      |     |     
3  #{@line_3[0]}  |  #{@line_3[1]}  |  #{@line_1[2]}  
      |     |     "
  end

  def play
    puts "\nType your move with either the letter X or O and the position(eg:X1A or x1a):"
    input = gets.chomp.downcase
    if input =~ /(x|o)([1-3])([a-c])/
      puts "Ok!"
    else
      puts "Not ok!"
    end
  end
  
end

TicTacToe.new