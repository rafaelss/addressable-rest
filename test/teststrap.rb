require "bundler/setup"
require "addressable/rest"
require "yajl"
require "fakeweb"
require "riot"

FakeWeb.register_uri(:get, "http://example.com/test_get", :body => "{\"success\":true}")
