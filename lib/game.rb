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

  def start
    setFutureGrid
    setCurrentGrid

  end

  def populate(grid)
    grid[2][1].setCurrent
    grid[2][2].setCurrent
    grid[2][3].setCurrent

  end

  def setFutureGrid

      @grid.each_with_index do |row, y|
        row.each_with_index {|cell, x|
          calculateFuture(cell, getNeighbours(cell, x, y))}
      end

  end

  def calculateFuture(cell, neighbours)
      values = neighbours.map {|neighbour| neighbour.current}
      if !cell.alive?
        cell.setFuture(true) if values.count(true) === 3
        return
      else
        if values.count(true) <= 1 || values.count(true) > 3
          cell.setFuture(false)
        else
          return
        end
      end
  end

  def setCurrentGrid

    @grid.each do |row|
      row.each {|cell| cell.updateCurrent}
    end

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
