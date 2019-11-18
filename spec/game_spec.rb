require 'game'

describe Game do
  describe 'initialize' do
    it 'initialises a new grid' do
      game = Game.new(5)
      expect(game.grid.length).to eq 5
      expect(game.grid[0].length).to eq 5
      expect(game.grid[1][0].alive?).to eq true
      expect(game.grid[1][1].alive?).to eq true
      expect(game.grid[1][2].alive?).to eq true
    end
  end

end
