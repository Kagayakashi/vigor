require "application_system_test_case"

class ImageCategoriesTest < ApplicationSystemTestCase
  setup do
    @image_category = image_categories(:one)
  end

  test "visiting the index" do
    visit image_categories_url
    assert_selector "h1", text: "Image categories"
  end

  test "should create image category" do
    visit image_categories_url
    click_on "New image category"

    fill_in "Name", with: @image_category.name
    click_on "Create Image category"

    assert_text "Image category was successfully created"
    click_on "Back"
  end

  test "should update Image category" do
    visit image_category_url(@image_category)
    click_on "Edit this image category", match: :first

    fill_in "Name", with: @image_category.name
    click_on "Update Image category"

    assert_text "Image category was successfully updated"
    click_on "Back"
  end

  test "should destroy Image category" do
    visit image_category_url(@image_category)
    click_on "Destroy this image category", match: :first

    assert_text "Image category was successfully destroyed"
  end
end
