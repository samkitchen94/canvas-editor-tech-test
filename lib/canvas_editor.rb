class CanvasEditor
  attr_reader :unstyled_canvas

  def initialize(m, n)
    @unstyled_canvas = Array.new(m){ Array.new(n, 'O') }
    @row_length = m
    @column_length = n
  end
end
