# Option Set
# A reusable set of option facets that can be applied to products.
# https://developer.bigcommerce.com/api/stores/v2/options_sets

module Bigcommerce
  class OptionSet < Resource
    include Bigcommerce::ResourceActions.new uri: 'v2/option_sets/%d'

    property :id
    property :name
    property :count
    property :options

    def self.count(params = {})
      get 'v2/option_sets/count', params
    end
  end
end
