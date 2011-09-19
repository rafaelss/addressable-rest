require "teststrap"

context Addressable::Rest do
  helper(:uri) { Addressable::URI.parse("http://example.com") }

  setup { uri }
  asserts_topic.respond_to(:get)
  asserts_topic.respond_to(:post)

  context "#get" do
    setup { uri.join("/test_get").get }
    asserts_topic.kind_of(Hash)
    asserts("success key") { topic["success"] }.equals(true)

    context "with :symbolize_keys as true" do
      setup { uri.join("/test_get").get(:symbolize_keys => true) }
      asserts("success key") { topic[:success] }.equals(true)
    end
  end

  context "#post" do
    setup { uri.join("/test_post").post(:param => 1) }
    asserts_topic.kind_of(Hash)
    asserts("success key") { topic["success"] }.equals(true)

    context "with :symbolize_keys as true" do
      setup { uri.join("/test_post").post({ :param => 1 }, :symbolize_keys => true) }
      asserts("success key") { topic[:success] }.equals(true)
    end
  end
end
