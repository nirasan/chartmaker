class Line < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  belongs_to :node
  belongs_to :next_node, :class_name => "Node", :foreign_key => "next_node_id"

  validates_presence_of :user
  validates_presence_of :diagram
  validates_presence_of :node
  validates_presence_of :next_node

  validates :description, length: {minimum: 1, maximum: 1024}
end
