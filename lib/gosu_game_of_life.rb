require 'gosu'
require_relative 'game'

class GameOfLifeWindow < Gosu::Window

  def initialize(height = 800, width=600)
    @height = height
    @width = width
    super height, width, false
    self.caption = "Game Of Life"


    @background_color = Gosu::Color.new(0xffdedede)
    @alive = Gosu::Color.new(0xff121212)
    @dead = Gosu::Color.new(0xffededed)



    # game
    @game = Game.new(5)

    @col_width = @width/@game.grid_size
    @row_height = @height/@game.grid_size

  end

  def update
    # ...
  end

  def draw
    draw_quad(0,0, @background_color, width, 0, @background_color,
    width, height, @background_color, 0, height, @background_color)

    @game.grid.each_with_index {|row, y|
      row.each_with_index {|cell, x|
    if cell.current == true
      draw_quad(x * @col_width, y * @row_height, @alive,
               x * @col_width + (@col_width - 1), y * @row_height, @alive,
               x * @col_width + (@col_width - 1), y * @row_height + (@row_height - 1), @alive,
               x * @col_width, y * @row_height + (@row_height - 1), @alive)

    else
      draw_quad(x * @col_width, y * @row_height, @dead,
               x * @col_width + (@col_width - 1), y * @row_height, @dead,
               x * @col_width + (@col_width - 1), y * @row_height + (@row_height - 1), @dead,
               x * @col_width, y * @row_height + (@row_height - 1), @dead)

               how do i increase board grid?


    end
  }
}

  end

  def needs_cursor?
    true
  end
end

GameOfLifeWindow.new.show
