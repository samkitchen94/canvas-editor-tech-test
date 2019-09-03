require_relative './canvas'

class CanvasEditor
  attr_reader :editor

  def initialize
    @editor = Canvas.new
  end

  def run
    while true do
      input = gets.chomp
      choose_selection(input)
      break if input == "X"
    end
  end

  def choose_selection(input)
    help_menu if input == "?"
    @editor.clear_canvas if input == "C"
    selections = input.split(" ")
    puts "Capital letters only please" if selections[0] == selections[0].downcase
    case input.split(" ")[0]
    when "I"
      @editor.draw(selections[1].to_i, selections[2].to_i)
    when "S"
      @editor.show
    when "L"
      @editor.colour_specific_pixel(selections[1].to_i, selections[2].to_i, selections[3])
    when "V"
      @editor.colour_vertical_section(selections[1].to_i, selections[2].to_i, selections[3].to_i, selections[4])
    when "H"
      @editor.colour_horizontal_section(selections[1].to_i, selections[2].to_i, selections[3].to_i, selections[4])
    when "F"
      @editor.fill(selections[1].to_i, selections[2].to_i, selections[3].to_i)
    when "W"
      @editor.scale(selections[1].to_i)
    end
  end

  private
  def help_menu
    puts "This is the help menu - please see a list of commands below"
    puts "I M N - Create a new M x N image with all pixels coloured white (O). Size must be between 1-250"
    puts "C - Clears the table, setting all pixels to white (O)."
    puts "L X Y C - Colours the pixel (X,Y) with colour C."
    puts "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)."
    puts "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)."
    puts "S - Show the contents of the current image"
    puts "X - Terminate the session"
  end
end
