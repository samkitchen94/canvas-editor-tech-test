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

  context "scaling the canvas" do
    it "increases the size of the canvas by given percentage" do
      canvas_editor.choose_selection("W 200")
      expect { canvas_editor.choose_selection("S") }.to output("OOOOOOOO\nOOOOOOOO\nOOOOOOOO\nOOOOOOOO\n").to_stdout
    end
    # it "decreases the size of the canvas by given percentage" do
    #   canvas_editor.choose_selection("I 4 4")
    #   canvas_editor.choose_selection("W 50")
    #   expect { canvas_editor.choose_selection("S") }.to output("OO\nOO\n").to_stdout
    # end
  end

  context "error messages" do
    it "gives an error when user enters number above 250" do
      expect { canvas_editor.choose_selection("I 251 40") }.to output("Invalid input - enter ? to see help screen\n").to_stdout
    end
  end
end
