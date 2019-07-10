require './lib/game'

RSpec.describe Game do
  prev_board = Board.new
  prev_names = {
    :x => 'Juan',
    :o => 'Eapen'
  }
  prev_turns = 1
  game = Game.new(prev_board,prev_names,prev_turns)
  describe '#turn' do
    before do                                  # for game.turn to not print anything
      allow($stdout).to receive(:write)
    end
    it 'not winning turn' do 
      allow(game).to receive(:gets) {"5\n"}    # giving the gets to turn method
      expect(game.turn(:x)).to eq(false)
      allow(game).to receive(:gets) {"6\n"}    # giving the gets to turn method
      expect(game.turn(:o)).to eq(false)
      allow(game).to receive(:gets) {"7\n"}    # giving the gets to turn method
      expect(game.turn(:x)).to eq(false)
      allow(game).to receive(:gets) {"9\n"}    # giving the gets to turn method
      expect(game.turn(:o)).to eq(false)
    end
    it 'winning turn' do 
      allow(game).to receive(:gets) {"3\n"}    # giving the gets to turn method
      expect(game.turn(:x)).to eq(true)
    end
  end
end
