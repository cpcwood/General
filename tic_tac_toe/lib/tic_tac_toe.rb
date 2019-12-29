class TicTacToe
  def initialize
    @player = 1
    @counter = 'O'
    @moves = ["-", "-", "-", "-", "-", "-", "-", "-", "-"]
    print "     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  -  \n     |     |     \n"
  end

  def start_game
    loop do
      loop do
        puts "Player #{@player} enter location of move"
        move = STDIN.gets.strip.to_i
        if @moves[move-1] == "-"
          @moves[move-1] = @counter
          break
        end
        puts "Position already taken, try again!"
      end
      print "     |     |     \n  #{@moves[0]}  |  #{@moves[1]}  |  #{@moves[2]}  \n_____|_____|_____\n     |     |     \n  #{@moves[3]}  |  #{@moves[4]}  |  #{@moves[5]}  \n_____|_____|_____\n     |     |     \n  #{@moves[6]}  |  #{@moves[7]}  |  #{@moves[8]}  \n     |     |     \n"
      return "Player #{@player} wins!" if check_status == true
      swap_player
    end
  end

  private

  def swap_player
    @player == 1 ? @player = 2 : @player = 1
    @counter == 'O' ? @counter = 'X' : @counter = 'O'
  end

  def check_status
    return true if @moves[0..2].all?{|n| n == "X" || n == "O"}
    return true if @moves[3..5].all?{|n| n == "X" || n == "O"}
    return true if @moves[6..8].all?{|n| n == "X" || n == "O"}
    return true if [@moves[0], @moves[3], @moves[6]].all?{|n| n == "X" || n == "O"}
    return true if [@moves[1], @moves[4], @moves[7]].all?{|n| n == "X" || n == "O"}
    return true if [@moves[2], @moves[5], @moves[8]].all?{|n| n == "X" || n == "O"}
    return true if [@moves[0], @moves[4], @moves[8]].all?{|n| n == "X" || n == "O"}
    return true if [@moves[2], @moves[4], @moves[6]].all?{|n| n == "X" || n == "O"}
  end
end
