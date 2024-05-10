require "test_helper"

class ImageCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_category = image_categories(:one)
  end

  test "should get index" do
    get image_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_image_category_url
    assert_response :success
  end

  test "should create image_category" do
    assert_difference("ImageCategory.count") do
      post image_categories_url, params: { image_category: { name: @image_category.name } }
    end

    assert_redirected_to image_category_url(ImageCategory.last)
  end

  test "should show image_category" do
    get image_category_url(@image_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_category_url(@image_category)
    assert_response :success
  end

  test "should update image_category" do
    patch image_category_url(@image_category), params: { image_category: { name: @image_category.name } }
    assert_redirected_to image_category_url(@image_category)
  end

  test "should destroy image_category" do
    assert_difference("ImageCategory.count", -1) do
      delete image_category_url(@image_category)
    end

    assert_redirected_to image_categories_url
  end
end
