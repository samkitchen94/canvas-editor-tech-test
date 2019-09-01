require_relative './canvas'

class CanvasEditor
  attr_reader :editor

  def initialize(editor = Canvas.new)
    @editor = editor
  end

  def run
    while true do
      input = gets.chomp
      choose_selection(input)
    end
  end

  def choose_selection(input)
    selections = input.split(" ")
      if input[0] == "I"
        @editor.draw(selections[1].to_i, selections[2].to_i)
      elsif input[0] == "S"
        @editor.show
      end
  end
end
