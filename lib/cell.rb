class Cell
  attr_reader :current

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


end
