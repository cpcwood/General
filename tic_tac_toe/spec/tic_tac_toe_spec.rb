require 'tic_tac_toe'

describe TicTacToe do
  describe '#new' do
    it 'displays tictactoe board' do
      expect{TicTacToe.new}.to output("     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  -  \n     |     |     \n").to_stdout
    end
  end

  describe '#start_game' do
    it 'allows player 1 to enter O in position 9' do
      allow($stdin).to receive(:gets).and_return('9')
      new = TicTacToe.new
      expect{new.start_game}.to output("Player 1 enter location of move\n     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  O  \n     |     |     \n").to_stdout
    end
    it 'allows player 2 to enter X in position 5' do
      allow($stdin).to receive(:gets).and_return('5')
      new = TicTacToe.new
      expect{new.start_game}.to output("Player 1 enter location of move\n     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  -  \n_____|_____|_____\n     |     |     \n  -  |  -  |  O  \n     |     |     \n").to_stdout
    end
  end
end
