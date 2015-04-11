require 'test_helper'

class LineTest < ActiveSupport::TestCase
  test "after_save and after_destroy" do

    node = Node.new({
                        user_id: users(:user1).id,
                        diagram_id: diagrams(:diagram1).id,
                        description: "MyDesc",
                        start: true,
                        end: true,
                    })
    assert node.save

    line = Line.new({
                        user_id: users(:user1).id,
                        diagram_id: diagrams(:diagram1).id,
                        node_id: nodes(:node1).id,
                        next_node_id: nodes(:node2).id,
                        description: "MyDesc",
                    })
    assert line.save
    assert_equal nodes(:node2).id, line.next_node_id

    line.node = node
    line.save
    node.reload
    assert_equal false, node.end, "lineが生えたので終端ノードではなくなる"

    line.next_node = node
    line.save
    node.reload
    assert_equal false, node.start, "lineに参照されたので開始ノードではなくなる"

    line.next_node = nodes(:node1)
    line.save
    node.reload
    assert_equal true, node.start, "lineの参照が外れたので開始ノードになる"

    line.destroy
    node.reload
    assert_equal true, node.end, "lineが消えたので終端ノードになる"

  end
end
