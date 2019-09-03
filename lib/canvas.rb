class Canvas
  attr_reader :canvas

  def initialize
    @canvas = nil
  end

  def draw(m, n)
    if n > 250 || m > 250
      puts "Invalid input - enter ? to see help screen"
    else
    @canvas = Array.new(m) { Array.new(n, 'O') }
  end
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
    arr = row1..row2
    arr.each { |p| colour_specific_pixel(column, p, letter) }
  end

  def colour_horizontal_section(column1, column2, row, letter)
    arr = column1..column2
    arr.each { |p| colour_specific_pixel(p, row, letter) }
  end

  def scale(percentage)
    scaling = percentage.to_i / 100
    duplicate = @canvas.dup
    if scaling >= 1
      @canvas.map! { |row| row * scaling }
      slice_size = (duplicate.size).ceil
      groups = duplicate.each_slice(slice_size).to_a
      scaling.times { @canvas.push(groups) }
    else
      (scaling * @canvas.length).times do
        @canvas.map! { |row| row.shift }
      end
    end
  end

end
