require "application_system_test_case"

class ShoppingCategoriesTest < ApplicationSystemTestCase
  setup do
    @shopping_category = shopping_categories(:one)
  end

  test "visiting the index" do
    visit shopping_categories_url
    assert_selector "h1", text: "Shopping categories"
  end

  test "should create shopping category" do
    visit shopping_categories_url
    click_on "New shopping category"

    fill_in "Color", with: @shopping_category.color
    fill_in "Importance", with: @shopping_category.importance
    fill_in "Notes", with: @shopping_category.notes
    fill_in "Title", with: @shopping_category.title
    click_on "Create Shopping category"

    assert_text "Shopping category was successfully created"
    click_on "Back"
  end

  test "should update Shopping category" do
    visit shopping_category_url(@shopping_category)
    click_on "Edit this shopping category", match: :first

    fill_in "Color", with: @shopping_category.color
    fill_in "Importance", with: @shopping_category.importance
    fill_in "Notes", with: @shopping_category.notes
    fill_in "Title", with: @shopping_category.title
    click_on "Update Shopping category"

    assert_text "Shopping category was successfully updated"
    click_on "Back"
  end

  test "should destroy Shopping category" do
    visit shopping_category_url(@shopping_category)
    click_on "Destroy this shopping category", match: :first

    assert_text "Shopping category was successfully destroyed"
  end
end
