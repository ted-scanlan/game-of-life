require 'gosu'
require_relative 'game'

class GameOfLifeWindow < Gosu::Window

  def initialize(height = 800, width=600)
    @height = height
    @width = width
    super height, width, false
    self.caption = "Game Of Life"


    @background_color = Gosu::color.new(add8e6)
  end

  def update
    # ...
  end

  def draw
    draw_quad(0,0, @background_color, width, 0, @background_color,
    width, height, @background_color, 0, height, @background_color)
    # ...
  end

  def needs_cursor?
    true
  end
end

GameOfLifeWindow.new.show
