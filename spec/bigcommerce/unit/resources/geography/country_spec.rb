RSpec.describe Bigcommerce::Country do
  before(:each) { @country = Bigcommerce::Country }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@country).to receive(:get).with('v2/countries/count', {})
      @country.count
    end
  end
end
