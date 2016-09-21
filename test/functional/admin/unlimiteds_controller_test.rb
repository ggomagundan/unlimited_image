require 'test_helper'

class Admin::UnlimitedsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Unlimited.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Unlimited.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Unlimited.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_unlimited_url(assigns(:unlimited))
  end

  def test_edit
    get :edit, :id => Unlimited.first
    assert_template 'edit'
  end

  def test_update_invalid
    Unlimited.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Unlimited.first
    assert_template 'edit'
  end

  def test_update_valid
    Unlimited.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Unlimited.first
    assert_redirected_to admin_unlimited_url(assigns(:unlimited))
  end

  def test_destroy
    unlimited = Unlimited.first
    delete :destroy, :id => unlimited
    assert_redirected_to admin_unlimiteds_url
    assert !Unlimited.exists?(unlimited.id)
  end
end
