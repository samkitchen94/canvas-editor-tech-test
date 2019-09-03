require 'canvas'

describe Canvas do
  let(:canvas) { Canvas.new }
  describe '#new' do
    it "initializes as nil" do
      expect(canvas.canvas).to be(nil)
    end
  end

  context 'drawing a blank canvas' do
    before :each do
      canvas.draw(2,4)
    end
    it "draws a blank canvas" do
      expect(canvas.canvas).to eq([["O", "O", "O", "O"], ["O", "O", "O", "O"]])
    end
    it "shows a blank canvas in the terminal when the program is running" do
      expect { canvas.show }.to output("OOOO\nOOOO\n").to_stdout
    end
  end
end
