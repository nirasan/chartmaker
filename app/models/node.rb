class Node < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  has_many :lines, dependent: :restrict_with_error
  has_many :connected_lines, class_name: "Line", foreign_key: "next_node_id", dependent: :restrict_with_error

  validates_presence_of :user
  validates_presence_of :diagram

  validates :description, length: {minimum: 1, maximum: 1024}

  def update_start_end
    self.start = Line.where(next_node_id: self.id).size <= 0
    self.end = self.lines.count <= 0
    if self.changed?
      self.save
    end
  end
end

