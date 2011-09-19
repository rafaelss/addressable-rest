require "addressable/rest/version"
require "addressable/rest/to_query" unless {}.respond_to?(:to_query)
require "addressable/uri"
require "net/http"
require "multi_json"

module Addressable
  module Rest
    def get(options = {})
      url = dup.normalize
      response = Net::HTTP.start(url.host, url.port) do |request|
        request.get(url.request_uri)
      end

      decode_options = {}
      decode_options[:symbolize_keys] = true if options[:symbolize_keys]
      MultiJson.decode(response.body, decode_options)
    end

    def post(data, options = {})
      url = dup.normalize
      response = Net::HTTP.start(url.host, url.port) do |request|
        request.post(url.request_uri, data.to_query)
      end

      decode_options = {}
      decode_options[:symbolize_keys] = true if options[:symbolize_keys]
      MultiJson.decode(response.body, decode_options)
    end
  end
end

Addressable::URI.send(:include, Addressable::Rest)
