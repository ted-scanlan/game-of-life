class Cell
  attr_reader :current, :state
  attr_writer :setCurrent

  def initialize
    @current = false

  end

  def alive?
    @current

  end

  def setFuture(state)
    @state = state

  end

  def updateCurrent
    @current = @state
  end

  def setCurrent
    @current = true

  end


end
