require "test_helper"

class ShoppingCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_category = shopping_categories(:one)
  end

  test "should get index" do
    get shopping_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_shopping_category_url
    assert_response :success
  end

  test "should create shopping_category" do
    assert_difference("ShoppingCategory.count") do
      post shopping_categories_url, params: { shopping_category: { color: @shopping_category.color, importance: @shopping_category.importance, notes: @shopping_category.notes, title: @shopping_category.title } }
    end

    assert_redirected_to shopping_category_url(ShoppingCategory.last)
  end

  test "should show shopping_category" do
    get shopping_category_url(@shopping_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopping_category_url(@shopping_category)
    assert_response :success
  end

  test "should update shopping_category" do
    patch shopping_category_url(@shopping_category), params: { shopping_category: { color: @shopping_category.color, importance: @shopping_category.importance, notes: @shopping_category.notes, title: @shopping_category.title } }
    assert_redirected_to shopping_category_url(@shopping_category)
  end

  test "should destroy shopping_category" do
    assert_difference("ShoppingCategory.count", -1) do
      delete shopping_category_url(@shopping_category)
    end

    assert_redirected_to shopping_categories_url
  end
end
