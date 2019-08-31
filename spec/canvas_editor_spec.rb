require 'canvas_editor'

describe CanvasEditor do
  let(:canvas) { CanvasEditor.new(2, 4) }
  describe '#new' do
    it "initializes with length of rows and columns" do
      expect(CanvasEditor).to respond_to(:new).with(2).arguments
    end
    it "initializes with n amount of m length arrays" do
      expect(canvas.unstyled_canvas).to eq([["O", "O", "O", "O"], ["O", "O", "O", "O"]])
    end
  end
end
