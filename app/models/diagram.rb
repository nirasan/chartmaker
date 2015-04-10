require 'gviz'

class Diagram < ActiveRecord::Base

  belongs_to :user
  has_many :nodes
  has_many :lines

  def get_dot
    diagram = self
    Graph do
      diagram.nodes.each do |node|
        id = "n#{node.id}".to_sym
        node id, {label:node.description}
      end
      diagram.lines.each do |line|
        id = "n#{line.node_id}_n#{line.next_node_id}".to_sym
        edge id, {label:line.description}
      end
    end
  end
end
