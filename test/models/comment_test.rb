require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Joe Bloggs", email: "joebloggs@example.com")

    @post = Post.create(title: "Test Title", content: "random text",
                     user_id: @user.id)
    @comment = Comment.create(content: "nice post mate", user_id: @user.id,
                              post_id: @post.id)
  end

  test "should be vailid" do
    assert @comment.valid?
  end

  test "attributes title and content should work" do
    assert @comment.content == "nice post mate"
    assert @comment.content != "other text"
  end

  test "definately linked to user" do
    assert User.find(@comment.user_id).username == "Joe Bloggs"
    assert User.find(@comment.user_id).username != "Joe Cloggs"
    assert Comment.find(@user.id).content == "nice post mate"
  end

  test "definately linked to post" do
    assert Post.find(@comment.post_id).title == "Test Title"
    assert Post.find(@comment.post_id).title != "Joe Cloggs"
    assert Comment.find(@post.id).content == "nice post mate"    
  end
end
