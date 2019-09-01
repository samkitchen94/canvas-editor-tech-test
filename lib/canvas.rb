class Canvas
  attr_reader :canvas

  def initialize
    @canvas = nil
  end

  def draw(m, n)
    @canvas = Array.new(m) { Array.new(n, 'O') }
  end

  def show
    @canvas.map{|row| puts row.join(" ")}
  end
end
