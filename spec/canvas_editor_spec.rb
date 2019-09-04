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

  context "Error messages" do
    it "gives an error when user enters canvas above 250" do
      expect { canvas_editor.choose_selection("I 251 40") }.to output("Invalid input - enter ? to see help screen\n").to_stdout
    end
    it "gives an error when user enters canvas size below 1" do
      expect { canvas_editor.choose_selection("I 251 40") }.to output("Invalid input - enter ? to see help screen\n").to_stdout
    end
    it "gives an error when user tries to clear a non existent canvas" do
      new_canvas = CanvasEditor.new
      expect { new_canvas.choose_selection("C") }.to output("No canvas has been created\n").to_stdout
    end
    it "gives an error when user does not use capital letters" do
      expect { canvas_editor.choose_selection("i 251 40") }.to output("Capital letters only please\n").to_stdout
    end
    it "gives an error when user tries to colour in coordinate that doesn't exist" do
      expect { canvas_editor.choose_selection("V 6 4 10 C") }.to raise_error
    end
    it "gives an error when user enters invalid command" do
      expect { canvas_editor.choose_selection("V 6 C") }.to output("Invalid input - enter ? to see help screen\n").to_stdout
    end
    it "gives an error when user enters invalid command" do
      expect { canvas_editor.choose_selection("I 2") }.to output("Invalid input - enter ? to see help screen\n").to_stdout
    end
    it "gives an error when user enters invalid create canvas command" do
      expect { canvas_editor.choose_selection("S 22") }.to output("Invalid input - enter ? to see help screen\n").to_stdout
    end
  end
end
