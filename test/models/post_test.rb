require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Joe Bloggs", email: "joebloggs@example.com")

    @post = Post.create(title: "Test Title", content: "random text",
                     user_id: @user.id)
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

  test "definately linked to user" do
    assert User.find(@post.user_id).username == "Joe Bloggs"
    assert User.find(@post.user_id).username != "Joe Cloggs"
  end
end
