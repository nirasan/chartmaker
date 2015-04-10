class Line < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  belongs_to :node
  belongs_to :next_node, :class_name => "Node", :foreign_key => "next_node_id"
end
