# SKU
# Stock Keeping Unit identifiers associated with products.
# https://developer.bigcommerce.com/api/stores/v2/products/skus

module Bigcommerce
  class Sku < Resource
    include Bigcommerce::SubresourceActions.new(uri: 'v2/products/%d/skus/%d', v3uri: 'v3/catalog/products/%d/variants/%d')

    property :id
    property :sku
    property :upc
    property :price
    property :weight
    property :options
    property :cost_price
    property :image_file
    property :product_id
    property :adjusted_price
    property :adjusted_weight
    property :inventory_level
    property :bin_picking_number
    property :is_purchasing_disabled
    property :inventory_warning_level
    property :purchasing_disabled_message
    property :count

    def self.count_all(params = {})
      get 'v2/products/skus/count', params
    end

    def self.count(product_id, params = {})
      get "v2/products/#{product_id}/skus/count", params
    end
  end
end
