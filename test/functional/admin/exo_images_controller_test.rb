require 'test_helper'

class Admin::ExoImagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ExoImage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ExoImage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ExoImage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_exo_image_url(assigns(:exo_image))
  end

  def test_edit
    get :edit, :id => ExoImage.first
    assert_template 'edit'
  end

  def test_update_invalid
    ExoImage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ExoImage.first
    assert_template 'edit'
  end

  def test_update_valid
    ExoImage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ExoImage.first
    assert_redirected_to admin_exo_image_url(assigns(:exo_image))
  end

  def test_destroy
    exo_image = ExoImage.first
    delete :destroy, :id => exo_image
    assert_redirected_to admin_exo_images_url
    assert !ExoImage.exists?(exo_image.id)
  end
end
