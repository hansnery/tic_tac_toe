class TicTacToe
  require_relative 'player'

  def initialize
    clear_board
    puts "\nWelcome to TicTacToe!"
    create_players
    play
  end

  def clear_board
    @line_1 = [" "," ", " "]
    @line_2 = [" "," ", " "]
    @line_3 = [" "," ", " "]
    @turn = 0
  end

  def print_board
    puts "   A     B     C
      |     |     
1  #{@line_1[0]}  |  #{@line_1[1]}  |  #{@line_1[2]}  
 _____|_____|_____
      |     |     
2  #{@line_2[0]}  |  #{@line_2[1]}  |  #{@line_2[2]}  
 _____|_____|_____
      |     |     
3  #{@line_3[0]}  |  #{@line_3[1]}  |  #{@line_3[2]}  
      |     |     "
  end

  def create_players
    puts "\nType Player 1's name:"
    name = gets.chomp
    @player_one = Player.new(name)

    puts "\nType Player 2's name:"
    name = gets.chomp
    @player_two = Player.new(name)
    puts "\n"
  end

  def check_board(input)
    if input[0].to_i == 1
      case input[1]
      when "a"
        if @line_1[0] != " "
          puts "\nThere's already one #{@line_1[0]} there!"
          play
        end
      when "b"
        if @line_1[1] != " "
          puts "\nThere's already one #{@line_1[1]} there!"
          play
        end
      when "c"
        if @line_1[2] != " "
          puts "\nThere's already one #{@line_1[2]} there!"
          play
        end
      end
    elsif input[0].to_i == 2
      case input[1]
      when "a"
        if @line_2[0] != " "
          puts "\nThere's already one #{@line_2[0]} there!"
          play
        end
      when "b"
        if @line_2[1] != " "
          puts "\nThere's already one #{@line_2[1]} there!"
          play
        end
      when "c"
        if @line_2[2] != " "
          puts "\nThere's already one #{@line_2[2]} there!"
          play
        end
      end
    elsif input[0].to_i == 3
      case input[1]
      when "a"
        if @line_3[0] != " "
          puts "\nThere's already one #{@line_3[0]} there!"
          play
        end
      when "b"
        if @line_3[1] != " "
          puts "\nThere's already one #{@line_3[1]} there!"
          play
        end
      when "c"
        if @line_3[2] != " "
          puts "\nThere's already one #{@line_3[2]} there!"
          play
        end
      end
    end
  end

  def modify_board(input, symbol)
    if input[0].to_i == 1
      case input[1]
      when "a"
        @line_1[0] = symbol
      when "b"
        @line_1[1] = symbol
      when "c"
        @line_1[2] = symbol
      end
    elsif input[0].to_i == 2
      case input[1]
      when "a"
        @line_2[0] = symbol
      when "b"
        @line_2[1] = symbol
      when "c"
        @line_2[2] = symbol
      end
    elsif input[0].to_i == 3
      case input[1]
      when "a"
        @line_3[0] = symbol
      when "b"
        @line_3[1] = symbol
      when "c"
        @line_3[2] = symbol
      end
    end
  end

  def check_lines
    if @line_1[0] == "X" && @line_1[1] == "X" && @line_1[2] == "X" || # check horizontal lines
       @line_2[0] == "X" && @line_2[1] == "X" && @line_2[2] == "X" ||
       @line_3[0] == "X" && @line_3[1] == "X" && @line_3[2] == "X" || 
       @line_1[0] == "X" && @line_2[0] == "X" && @line_3[0] == "X" || # check vertical lines
       @line_1[1] == "X" && @line_2[1] == "X" && @line_3[1] == "X" || 
       @line_1[2] == "X" && @line_2[2] == "X" && @line_3[2] == "X" || 
       @line_1[0] == "X" && @line_2[1] == "X" && @line_3[2] == "X" || # check diagonal lines
       @line_1[2] == "X" && @line_2[1] == "X" && @line_3[0] == "X"
      puts "\n#{@player_one.name} wins!\n"
      @player_one.wins += 1
      show_score
      ask_for_a_rematch
    elsif @line_1[0] == "O" && @line_1[1] == "O" && @line_1[2] == "O" || # check horizontal lines
          @line_2[0] == "O" && @line_2[1] == "O" && @line_2[2] == "O" ||
          @line_3[0] == "O" && @line_3[1] == "O" && @line_3[2] == "O" || 
          @line_1[0] == "O" && @line_2[0] == "O" && @line_3[0] == "O" || # check vertical lines
          @line_1[1] == "O" && @line_2[1] == "O" && @line_3[1] == "O" || 
          @line_1[2] == "O" && @line_2[2] == "O" && @line_3[2] == "O" || 
          @line_1[0] == "O" && @line_2[1] == "O" && @line_3[2] == "O" || # check diagonal lines
          @line_1[2] == "O" && @line_2[1] == "O" && @line_3[0] == "O"
      puts "\n#{@player_two.name} wins!\n"
      @player_two.wins += 1
      show_score
      ask_for_a_rematch
    end
  end

  def show_score
    puts "\n#{@player_one.name}: #{@player_one.wins}\n#{@player_two.name}: #{@player_two.wins}\n"
  end

  def ask_for_a_rematch
    puts "\nDo you want a rematch? Type 'yes' or 'no'."
    input = gets.chomp.downcase
    puts "\n"

    if input == "yes"
      clear_board
      play
    else
      puts "\nThe game ended with this score:"
      show_score
      @@input = exit
    end
  end

  def play
    @@input = nil

    while @@input != "exit"
      check_lines

      print_board

      if @turn == 0
        symbol = "X"
        puts "\nIt's #{@player_one.name}'s turn!\n"
      else
        symbol = "O"
        puts "\nIt's #{@player_two.name}'s turn!\n"
      end

      puts "\nType your move the position on the board (eg:1A):"

      @@input = gets.chomp.downcase

      if @@input =~ /([1-3])([a-c])/
        check_board(@@input)
        modify_board(@@input, symbol)
        print_board
        if @turn == 0
          @turn = 1
        else
          @turn = 0
        end
      else
        puts "Invalid position! Try again or type 'exit' to quit."
      end
    end
  end
end

TicTacToe.new