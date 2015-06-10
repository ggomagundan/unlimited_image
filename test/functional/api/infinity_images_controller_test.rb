require 'test_helper'

class Api::InfinityImagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => InfinityImage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    InfinityImage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    InfinityImage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to api_infinity_image_url(assigns(:infinity_image))
  end

  def test_edit
    get :edit, :id => InfinityImage.first
    assert_template 'edit'
  end

  def test_update_invalid
    InfinityImage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => InfinityImage.first
    assert_template 'edit'
  end

  def test_update_valid
    InfinityImage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => InfinityImage.first
    assert_redirected_to api_infinity_image_url(assigns(:infinity_image))
  end

  def test_destroy
    infinity_image = InfinityImage.first
    delete :destroy, :id => infinity_image
    assert_redirected_to api_infinity_images_url
    assert !InfinityImage.exists?(infinity_image.id)
  end
end
