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
    end
  end

  private
  def help_menu
    puts "This is the help menu"
  end
end
