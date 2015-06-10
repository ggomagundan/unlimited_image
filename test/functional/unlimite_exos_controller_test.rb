require 'test_helper'

class UnlimiteExosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UnlimiteExo.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UnlimiteExo.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UnlimiteExo.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to unlimite_exo_url(assigns(:unlimite_exo))
  end

  def test_edit
    get :edit, :id => UnlimiteExo.first
    assert_template 'edit'
  end

  def test_update_invalid
    UnlimiteExo.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UnlimiteExo.first
    assert_template 'edit'
  end

  def test_update_valid
    UnlimiteExo.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UnlimiteExo.first
    assert_redirected_to unlimite_exo_url(assigns(:unlimite_exo))
  end

  def test_destroy
    unlimite_exo = UnlimiteExo.first
    delete :destroy, :id => unlimite_exo
    assert_redirected_to unlimite_exos_url
    assert !UnlimiteExo.exists?(unlimite_exo.id)
  end
end
