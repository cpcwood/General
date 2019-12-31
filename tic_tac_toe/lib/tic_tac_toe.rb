class TicTacToe
  def initialize
    new_game
  end

  def start_game
    loop do
      board
      loop do
        loop do
          puts "Player #{@player} enter location of move"
          move = STDIN.gets.strip.to_i
          if move.to_i == 0
            puts 'Enter valid position (1-9)'
          elsif @moves[move-1] == "-"
            @moves[move-1] = @counter
            break
          else
            puts "Position already taken, try again!"
          end
        end
        board
        break puts "Player #{@player} wins!" if check_status == true
        break puts "It's a draw" if draw == true
        swap_player
      end
      loop do
        puts 'Play again? (Y/N)'
        answer = STDIN.gets.strip
        if answer == 'Y' || answer == 'y'
          new_game
          break
        elsif answer == 'N' || answer == 'n'
          return "Game over!"
        else
          puts "Incorrect input, try again!"
        end
      end
    end
  end

  private

  def board
    print "     |     |     \n  #{@moves[0]}  |  #{@moves[1]}  |  #{@moves[2]}  \n_____|_____|_____\n     |     |     \n  #{@moves[3]}  |  #{@moves[4]}  |  #{@moves[5]}  \n_____|_____|_____\n     |     |     \n  #{@moves[6]}  |  #{@moves[7]}  |  #{@moves[8]}  \n     |     |     \n"
  end

  def new_game
    @player = 1
    @counter = 'O'
    @moves = ["-", "-", "-", "-", "-", "-", "-", "-", "-"]
  end

  def draw
    @moves.all?{|n| n == 'O' || n == 'X'}
  end

  def swap_player
    @player == 1 ? @player = 2 : @player = 1
    @counter == 'O' ? @counter = 'X' : @counter = 'O'
  end

  def check_status
    return true if @moves[0..2].all?{|n| n == "X"}
    return true if @moves[0..2].all?{|n| n == "O"}
    return true if @moves[3..5].all?{|n| n == "X"}
    return true if @moves[3..5].all?{|n| n == "O"}
    return true if @moves[6..8].all?{|n| n == "X"}
    return true if @moves[6..8].all?{|n| n == "O"}
    return true if [@moves[0], @moves[3], @moves[6]].all?{|n| n == "X"}
    return true if [@moves[0], @moves[3], @moves[6]].all?{|n| n == "O"}
    return true if [@moves[1], @moves[4], @moves[7]].all?{|n| n == "X"}
    return true if [@moves[1], @moves[4], @moves[7]].all?{|n| n == "O"}
    return true if [@moves[2], @moves[5], @moves[8]].all?{|n| n == "X"}
    return true if [@moves[2], @moves[5], @moves[8]].all?{|n| n == "O"}
    return true if [@moves[0], @moves[4], @moves[8]].all?{|n| n == "X"}
    return true if [@moves[0], @moves[4], @moves[8]].all?{|n| n == "O"}
    return true if [@moves[2], @moves[4], @moves[6]].all?{|n| n == "X"}
    return true if [@moves[2], @moves[4], @moves[6]].all?{|n| n == "O"}
  end
end
