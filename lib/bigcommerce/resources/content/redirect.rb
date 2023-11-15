# Redirect
# Redirects are used to create custom URL paths that map to resources on the
# storefront (such as products, categories, brands, etc.) or manually defined
# static URLs.
# https://developer.bigcommerce.com/api/stores/v2/redirects

module Bigcommerce
  class Redirect < Resource
    include Bigcommerce::ResourceActions.new uri: 'v2/redirects/%d'

    property :id
    property :count
    property :path
    property :forward
    property :url

    def self.count(params = {})
      get 'v2/redirects/count', params
    end
  end
end
