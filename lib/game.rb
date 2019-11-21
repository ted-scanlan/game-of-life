require_relative 'cell.rb'

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
    populate(grid)
    return grid
  end

  def populate(grid)
    grid[2][1].setCurrent
    grid[2][2].setCurrent
    grid[2][3].setCurrent

  end

  def setFutureGrid

      @grid.each_with_index do |row, y|
        row.each_with_index {|cell, x|
          calculate(x, y, cell, getNeighbours(cell, x, y))}
      end
  end

  def calculate(x, y, cell, neighbours)

      values = neighbours.map {|cell| cell.current}
      return values
  end

  def getNeighbours(cell, x, y)

    [NilClass, Array].each do |klass|

      klass.class_eval do
        def [](index)
          return nil if index < 0 or index > self.size rescue nil
          self.fetch(index) rescue nil
        end
      end
    end
    return @grid.near(x,y)
  end
end


class Array

  # calculate near values and remove nils with #compact method.
  def near(j,i)
    [ self[i - 1][j - 1], self[i - 1][j - 0], self[i - 1][j + 1],
    self[i - 0][j - 1],                     self[i - 0][j + 1],
    self[i + 1][j - 1], self[i + 1][j - 0], self[i + 1][j + 1],
  ].compact
end
end
