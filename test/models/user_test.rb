require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Joe Bloggs", email: "joebloggs@example.com")
  end

  test "should be vailid" do
    assert @user.valid?
  end

  test "attributes name and email should work" do
    assert @user.username == "Joe Bloggs"
    assert @user.username != "another string"
    assert @user.email == "joebloggs@example.com"
    assert @user.email != "joeggs@exple.com"
  end
end
