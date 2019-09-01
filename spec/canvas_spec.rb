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
  end
end
