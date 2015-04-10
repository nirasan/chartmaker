require 'test_helper'

class LinesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @line = lines(:line1)
    @user1 = users(:user1)
    @user2 = users(:user2)
    sign_in :user, @user1
  end

  test "should get index" do
    get :index, node_id: @line.node.id
    assert_response :success
    assert_not_nil assigns(:lines)
  end

  test "should get new" do
    get :new, node_id:@line.node_id
    assert_response :success
  end

  test "should create line" do
    assert_difference('Line.count') do
      post :create, node_id: @line.node.id, line: { description: @line.description, diagram_id: @line.diagram_id, next_node_id: @line.next_node_id, node_id: @line.node_id, user_id: @line.user_id }
    end

    assert_redirected_to line_path(assigns(:line))
  end

  test "should show line" do
    get :show, id: @line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line
    assert_response :success
  end

  test "should update line" do
    patch :update, id: @line, line: { description: @line.description, diagram_id: @line.diagram_id, next_node_id: @line.next_node_id, node_id: @line.node_id, user_id: @line.user_id }
    assert_redirected_to line_path(assigns(:line))
  end

  test "should destroy line" do
    assert_difference('Line.count', -1) do
      delete :destroy, id: @line
    end

    assert_redirected_to node_lines_path(@line.node)
  end
end
