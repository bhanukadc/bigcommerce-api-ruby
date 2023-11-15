RSpec.describe Bigcommerce::Option do
  before(:each) { @option = Bigcommerce::Option }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@option).to receive(:get).with('v2/options/count', {})
      @option.count
    end
  end
end
