RSpec.describe Bigcommerce::Brand do
  before(:each) { @brand = Bigcommerce::Brand }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@brand).to receive(:get).with('v2/brands/count', {})
      @brand.count
    end
  end
end
