require 'test_helper'

class TabsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tabs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tab
    assert_difference('Tab.count') do
      post :create, :tab => { }
    end

    assert_redirected_to tab_path(assigns(:tab))
  end

  def test_should_show_tab
    get :show, :id => tabs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tabs(:one).id
    assert_response :success
  end

  def test_should_update_tab
    put :update, :id => tabs(:one).id, :tab => { }
    assert_redirected_to tab_path(assigns(:tab))
  end

  def test_should_destroy_tab
    assert_difference('Tab.count', -1) do
      delete :destroy, :id => tabs(:one).id
    end

    assert_redirected_to tabs_path
  end
end
