require './lib/board'

RSpec.describe Board do
  board = Board.new
  empty_matrix = [[1,2,3],[4,5,6],[7,8,9]]
  describe '#add ' do
    it 'adding valid tile and value' do
      expect( board.add(1,'x') ).to eql('x')
      expect( board.add(2,'o') ).to eql('o')
      expect( board.add(5,'x') ).to eql('x')
      expect( board.add(9,'o') ).to eql('o')
    end
    it 'adding unvalid tile and value' do
      expect( board.add(10,'x') ).to eql(false)
      expect( board.add(-6,'o') ).to eql(false)
      expect( board.add(5,'x') ).to eql(false)
      expect( board.add(9,'o') ).to eql(false)
    end
  end
  describe '#clear ' do
    it 'clears the board' do
      expect( board.clear ).to eql(empty_matrix)
    end
  end
end