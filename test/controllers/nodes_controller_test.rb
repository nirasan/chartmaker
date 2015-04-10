require 'test_helper'

class NodesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @node = nodes(:node1)
    @user1 = users(:user1)
    sign_in :user, @user1
  end

  test "should get index" do
    get :index, diagram_id: @node.diagram_id
    assert_response :success
    assert_not_nil assigns(:nodes)
  end

  test "should get new" do
    get :new, diagram_id:@node.diagram_id
    assert_response :success
  end

  test "should create node" do
    assert_difference('Node.count') do
      post :create, diagram_id: @node.diagram.id, node: {description: "node desc"}
    end

    assert_redirected_to node_path(assigns(:node))
  end

  test "should show node" do
    get :show, id: @node
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @node
    assert_response :success
  end

  test "should update node" do
    patch :update, id: @node, node: {description: "new node desc"}
    assert_redirected_to node_path(assigns(:node))
  end

  test "should destroy node" do
    assert_difference('Node.count', -1) do
      delete :destroy, id: @node
    end

    assert_redirected_to diagram_nodes_path(@node.diagram)
  end
end
