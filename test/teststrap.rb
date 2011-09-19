require "bundler/setup"
require "addressable/rest"
require "yajl"
require "fakeweb"
require "riot"

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, "http://example.com/test_get", :body => "{\"success\":true}")
FakeWeb.register_uri(:post, "http://example.com/test_post", :body => "{\"success\":true}")
