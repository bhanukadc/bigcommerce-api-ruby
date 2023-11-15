RSpec.describe Bigcommerce::Coupon do
  before(:each) { @coupon = Bigcommerce::Coupon }

  describe '.count' do
    it 'should hit the correct path' do
      expect(@coupon).to receive(:get).with('v2/coupons/count', {})
      @coupon.count
    end
  end
end
