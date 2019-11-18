class Game
  attr_reader :grid

  def initialize(grid_size)
    @grid = make_grid(grid_size)



  end

  def make_grid(size)
    grid = []
    size.times do
      row = []
      size.times{row.push(Cell.new)}
      grid.push(row)
    end

    return grid
  end

  def populate(grid)
    grid[1][0].

  end



  end
