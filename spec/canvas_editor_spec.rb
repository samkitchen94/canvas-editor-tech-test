require 'canvas_editor'

describe CanvasEditor do
  canvas_editor = CanvasEditor.new
  before :each do
    canvas_editor.choose_selection("I 2 4")
  end
  context "drawing canvas" do
    it "draws a canvas from users selection" do
      expect { canvas_editor.choose_selection("S") }.to output("OOOO\nOOOO\n").to_stdout
    end
  end

  context "help menu" do
    it "shows the help menu when user chooses ?" do
      expect { canvas_editor.choose_selection("?") }.to output("This is the help menu\n").to_stdout
    end
  end

  context "editing the canvas" do
    it "changes a specific pixel in the canvas with the letter chosen" do
      canvas_editor.choose_selection("L 2 2 C")
      expect { canvas_editor.choose_selection("S") }.to output("OOOO\nOCOO\n").to_stdout
    end
    it "clears the canvas back to white" do
      canvas_editor.choose_selection("L 2 2 C")
      canvas_editor.choose_selection("C")
      expect { canvas_editor.choose_selection("S") }.to output("OOOO\nOOOO\n").to_stdout
    end
    it "draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)" do
      canvas_editor.choose_selection("V 2 1 2 C")
      expect { canvas_editor.choose_selection("S") }.to output("OCOO\nOCOO\n").to_stdout
    end
    it "draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)" do
      canvas_editor.choose_selection("H 2 3 2 C")
      expect { canvas_editor.choose_selection("S") }.to output("OOOO\nOCCO\n").to_stdout
    end
  end
end
