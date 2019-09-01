require_relative './canvas'

class CanvasEditor
  def initialize
    @canvas = Canvas.new
  end

  def run
    @canvas.draw(2, 4)
    @canvas.show
  end
end
