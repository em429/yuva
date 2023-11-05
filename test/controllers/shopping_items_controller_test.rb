require "test_helper"

class ShoppingItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_item = shopping_items(:one)
  end

  test "should get index" do
    get shopping_items_url
    assert_response :success
  end

  test "should get new" do
    get new_shopping_item_url
    assert_response :success
  end

  test "should create shopping_item" do
    assert_difference("ShoppingItem.count") do
      post shopping_items_url, params: { shopping_item: { importance: @shopping_item.importance, notes: @shopping_item.notes, shopping_category_id: @shopping_item.shopping_category_id, status: @shopping_item.status, title: @shopping_item.title, unit: @shopping_item.unit } }
    end

    assert_redirected_to shopping_item_url(ShoppingItem.last)
  end

  test "should show shopping_item" do
    get shopping_item_url(@shopping_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopping_item_url(@shopping_item)
    assert_response :success
  end

  test "should update shopping_item" do
    patch shopping_item_url(@shopping_item), params: { shopping_item: { importance: @shopping_item.importance, notes: @shopping_item.notes, shopping_category_id: @shopping_item.shopping_category_id, status: @shopping_item.status, title: @shopping_item.title, unit: @shopping_item.unit } }
    assert_redirected_to shopping_item_url(@shopping_item)
  end

  test "should destroy shopping_item" do
    assert_difference("ShoppingItem.count", -1) do
      delete shopping_item_url(@shopping_item)
    end

    assert_redirected_to shopping_items_url
  end
end
