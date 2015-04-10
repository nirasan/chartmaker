require 'test_helper'

class DiagramsControllerTest < ActionController::TestCase
  setup do
    @diagram = diagrams(:diagram1)
    @user1 = users(:user1)
    @user2 = users(:user2)
    sign_in :user, @user1
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diagrams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diagram" do
    assert_difference('Diagram.count') do
      post :create, diagram: { description: @diagram.description, title: @diagram.title, user_id: @diagram.user_id }
    end

    assert_redirected_to diagram_path(assigns(:diagram))
  end

  test "should show diagram" do
    get :show, id: @diagram
    assert_response :success
  end

  test "should not show diagram" do
    sign_in :user, @user2
    get :show, id: @diagram
    assert_response :forbidden
    sign_in :user, @user1
  end

  test "should get edit" do
    get :edit, id: @diagram
    assert_response :success
  end

  test "should update diagram" do
    patch :update, id: @diagram, diagram: { description: @diagram.description, title: @diagram.title, user_id: @diagram.user_id }
    assert_redirected_to diagram_path(assigns(:diagram))
  end

  test "should destroy diagram" do
    assert_difference('Diagram.count', -1) do
      delete :destroy, id: @diagram
    end

    assert_redirected_to diagrams_path
  end
end
