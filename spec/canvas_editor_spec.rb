require 'canvas_editor'

describe CanvasEditor do
  canvas_editor = CanvasEditor.new
  it "draws a canvas from users selection" do
    canvas_editor.choose_selection("I 2 4")
    expect { canvas_editor.choose_selection("S") }.to output("OOOO\nOOOO\n").to_stdout
  end
end
