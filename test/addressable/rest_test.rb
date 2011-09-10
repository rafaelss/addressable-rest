require "teststrap"

context Addressable::Rest do
  helper(:uri) { Addressable::URI.parse("http://example.com/test_get") }

  setup { uri }
  asserts_topic.respond_to(:get)

  context "#get" do
    setup { uri.get }
    asserts_topic.kind_of(Hash)
    asserts("success key") { topic["success"] }.equals(true)

    context "with :symbolize_keys as true" do
      setup { uri.get(:symbolize_keys => true) }
      asserts("success key") { topic[:success] }.equals(true)
    end
  end
end
