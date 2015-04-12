require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  test "has_many dependent restrict_with_error" do

    node = Node.new({
                         user: users(:user1),
                         diagram: diagrams(:diagram1),
                         description: "MyDesc",
                         start: false,
                         end: false,
                     })
    assert node.save

    line = Line.new({
                        user: users(:user1),
                        diagram: diagrams(:diagram1),
                        node: node,
                        next_node: nodes(:node1),
                        description: "MyDesc",
                    })
    assert line.save

    assert_equal false, node.destroy
    assert_equal 1, node.errors.count

    line.node = nodes(:node1)
    line.next_node = node
    line.save
    node = Node.find(node.id)

    assert_equal false, node.destroy
    assert_equal 1, node.errors.count

    line.node = nodes(:node1)
    line.next_node = nodes(:node2)
    line.save
    node = Node.find(node.id)

    assert_equal true, !!node.destroy
  end
end
