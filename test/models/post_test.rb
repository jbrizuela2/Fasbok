require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "model is invalid without required fields" do
    @post = Post.new

    assert_not @post.valid?
  end

  test "model is valid with the required fields" do
    @post = Post.new(title: "test", content: "test", user: users(:juan))

    assert @post.valid?
  end

  test "it works the other way" do
    @user = users(:juan)

    @post = @user.posts.new(title: "test", content: "test")

    assert @post.valid?
  end

  test "user can have many posts" do
    @user = users(:juan)
    @post = posts(:one)

    assert_difference "@user.posts.count", 1 do
      @user.posts.create(title: "test", content: "test")
    end

    assert_equal 2, @user.posts.count
  end
end
