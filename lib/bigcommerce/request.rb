require 'json'

module Bigcommerce
  class PathBuilder
    attr_reader :uri, :v3uri

    def initialize(uri, v3uri)
      @uri = uri
      @v3uri = v3uri
    end

    # This takes the @uri and inserts the keys to form a path.
    # To start we make sure that for nil/numeric values, we wrap those into an
    # array. We then scan the string for %d and %s to find the number of times
    # we possibly need to insert keys into the URI. Next, we check the size of
    # the keys array, if the keys size is less than the number of possible keys
    # in the URI, we will remove the trailing %d or %s, then remove the
    # trailing /. We then pass the keys into the uri to form the path.
    # ex. foo/%d/bar/%d => foo/1/bar/2
    def build(keys = [])
      keys = [] if keys.nil?
      keys = [keys] if keys.is_a? Numeric
      ids = final_uri.scan('%d').count + final_uri.scan('%s').count
      str = ids > keys.size ? final_uri.chomp('%d').chomp('%s').chomp('/') : final_uri
      (str % keys).chomp('/')
    end

    def final_uri
      final_uri ||= (!Bigcommerce.config.nil? && Bigcommerce.config['version'] == 3) ? (v3uri || uri) : (uri || v3uri)
    end

    def to_s
      final_uri
    end
  end

  class Request < Module
    def initialize(uri, v3uri=nil)
      @uri = uri
      @v3uri = v3uri
    end

    def included(base)
      base.extend ClassMethods
      path_builder = PathBuilder.new(@uri, @v3uri)
      base.define_singleton_method :path do
        path_builder
      end
    end

    module ClassMethods
      def get(path, params = {})
        response = raw_request(:get, path, params)
        build_response_object response
      end

      def delete(path, params = {})
        response = raw_request(:delete, path, params)
        response.body
      end

      def post(path, params = {})
        response = raw_request(:post, path, params)
        build_response_object response
      end

      def put(path, params = {})
        response = raw_request(:put, path, params)
        build_response_object response
      end

      def raw_request(method, path, params = {})
        client = params.delete(:connection) || Bigcommerce.api
        client.send(method, path.to_s, params)
      end

      private

      def build_response_object(response)
        json = parse response.body
        if json.is_a?(Hash) && json[:data].present?
          json = json[:data] if json[:data].is_a? Array
        end
        if json.is_a? Array
          json.map { |obj| new obj }
        else
          new json
        end
      end

      def parse(json)
        return [] if json.empty?
        JSON.parse(json, symbolize_names: true)
      end
    end
  end
end
