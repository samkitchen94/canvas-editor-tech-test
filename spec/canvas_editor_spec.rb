require 'canvas_editor'

describe CanvasEditor do
  describe '#new' do
    it "initializes with length of rows and columns" do
      expect(CanvasEditor).to respond_to(:new).with(2).arguments
    end
  end
end
