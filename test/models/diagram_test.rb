require 'test_helper'

class DiagramTest < ActiveSupport::TestCase

  test "get_dot" do
    diagram = diagrams(:diagram1)
    dot = diagram.get_dot
    assert dot.is_a? Gviz
    assert_equal dot.nodeset.count, 3
    assert_equal dot.edgeset.count, 2
    assert_not_empty dot.to_s
  end
end
