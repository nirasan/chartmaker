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

  #next_node が同一 diagram であることを確認
  validate :parent_records_must_be_same
  def parent_records_must_be_same
    if node.diagram_id != self.diagram_id
      errors.add(:node, "has not same parent")
    end
    if next_node.diagram_id != self.diagram_id
      errors.add(:next_node, "has not same parent")
    end
  end

  # 変更前後の node, next_node について start, end フラグのチェック
  after_save do
    if self.node_id_changed?
      self.node.update_start_end
    end
    if self.next_node_id_changed?
      self.next_node.update_start_end
      if !self.next_node_id_was.nil?
        Node.find(self.next_node_id_was).update_start_end
      end
    end
  end
  after_destroy do
    self.node.update_start_end
    self.next_node.update_start_end
  end
end
