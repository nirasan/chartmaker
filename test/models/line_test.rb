require 'test_helper'

class LineTest < ActiveSupport::TestCase
  test "save" do
    line = Line.new({
                        user_id: users(:user1).id,
                        diagram_id: diagrams(:diagram1).id,
                        node_id: nodes(:node1).id,
                        next_node_id: nodes(:node2).id,
                        description: "MyDesc",
                    })
    assert line.save
    assert_equal nodes(:node2).id, line.next_node_id
  end
end
