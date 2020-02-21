require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid"  do
    assert @category.valid?
  end

  test "name should be present" do
    category = Category.new
    assert_not category.valid?
  end

  test "name should be unique" do
    @category.save

     another_category_with_same_name = Category.new(name: "sports")
    assert_not another_category_with_same_name.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end
