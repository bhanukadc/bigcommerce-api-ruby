# Currency
# https://developer.bigcommerce.com/api/stores/v2/currencies

module Bigcommerce
  class Currency < Resource
    include Bigcommerce::ResourceActions.new uri: 'currencies/%d'

    property :id
    property :is_default
    property :country_iso2
    property :currency_code
    property :currency_exchange_rate
    property :token
    property :decimal_token
    property :thousands_token
    property :decimal_places

    def self.count(params = {})
      get 'currencies/count', params
    end
  end
end
