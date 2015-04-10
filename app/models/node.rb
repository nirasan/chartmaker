class Node < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  has_many :lines

  validates_presence_of :user
  validates_presence_of :diagram
  validates_presence_of :lines

  validates :description, length: {minimum: 1, maximum: 1024}
end
