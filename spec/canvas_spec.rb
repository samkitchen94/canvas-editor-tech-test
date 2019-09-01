require 'canvas'

describe Canvas do
  let(:canvas) { Canvas.new }
  describe '#new' do
    it "initializes as nil" do
      expect(canvas.canvas).to be(nil)
    end
  end

  context 'drawing a blank canvas' do
    it "draws a blank canvas" do
      canvas.draw(2, 4)
      expect(canvas.canvas).to eq([["O", "O", "O", "O"], ["O", "O", "O", "O"]])
    end
    it "shows a blank canvas in the terminal when the program is running" do
      canvas.draw(2, 4)
      expect { canvas.show }.to output("OOOO\nOOOO\n").to_stdout
    end
  end

  context "it colours in x, y pixel with colour C" do
    it "colours in the specified pixel" do
      
    end
  end

end
