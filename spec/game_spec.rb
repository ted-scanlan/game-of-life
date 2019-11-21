require 'game'

describe Game do
  describe 'initialize' do
    it 'initialises a new grid' do
      game = Game.new(5)
      expect(game.grid.length).to eq 5
      expect(game.grid[0].length).to eq 5
      expect(game.grid[2][1].alive?).to eq true
      expect(game.grid[2][2].alive?).to eq true
      expect(game.grid[2][3].alive?).to eq true
    end
  end
  describe 'setFutureGrid' do
    it 'goes through grid and sets the future state of each grid' do
      game = Game.new(5)
      game.setFutureGrid
      expect(game.grid[1][2].state).to eq true
    end

  end

  describe 'setCurrentGrid' do
    it 'goes through grid and sets each cells current state based on the future state of that cell' do
      game = Game.new(5)
      game.setFutureGrid
      game.setCurrentGrid
      expect(game.grid[1][2].current).to eq true
    end

  end
end
