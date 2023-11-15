# Custom Field
# Custom fields associated with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/custom_fields

module Bigcommerce
  class Metafield < Resource
    include Bigcommerce::SubresourceActions.new(
      uri: nil,
      v3uri: 'v3/catalog/products/%d/metafields/%d'
    )

    property :id
    property :key
    property :value
    property :description
    property :resource_id

  end
end
