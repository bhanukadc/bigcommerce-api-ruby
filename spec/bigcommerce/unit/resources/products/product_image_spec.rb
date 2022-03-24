RSpec.describe Bigcommerce::ProductImage do
  before(:each) { @image = Bigcommerce::ProductImage }

  let(:params) { 1 }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@image).to receive(:get).with('v2/products/1/images/count', {})
      @image.count params
    end
  end

  describe '.count_all' do
    it 'should hit the correct path' do
      expect(@image).to receive(:get).with('v2/products/images/count', {})
      @image.count_all
    end
  end
end
