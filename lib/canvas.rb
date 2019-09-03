class Canvas
  attr_reader :canvas

  def initialize
    @canvas = nil
  end

  def draw(m, n)
    @canvas = Array.new(m) { Array.new(n, 'O') }
  end

  def show
    @canvas.map{|row| puts row.join("")}
  end

  def colour_specific_pixel(column, row, letter)
    @canvas[row - 1][column - 1] = letter
  end

  def clear_canvas
    @canvas.each do |row|
      row.map! { "O" }
    end
  end

  def colour_vertical_section(column, row1, row2, letter)
    @canvas.each do |row|
      if @canvas[row1]..@canvas[row2]
        row[column - 1] = letter
      end
    end
  end

end
