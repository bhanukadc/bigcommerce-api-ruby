RSpec.describe Bigcommerce::Redirect do
  before(:each) { @redirect = Bigcommerce::Redirect }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@redirect).to receive(:get).with('v2/redirects/count', {})
      @redirect.count
    end
  end
end
