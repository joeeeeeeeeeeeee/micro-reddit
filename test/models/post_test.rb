require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "Test Title", content: "random text")
  end

  test "should be vailid" do
    assert @post.valid?
  end

  test "attributes title and content should work" do
    assert @post.title == "Test Title"
    assert @post.title != "another string"
    assert @post.content == "random text"
    assert @post.content != "other text"
  end
end
