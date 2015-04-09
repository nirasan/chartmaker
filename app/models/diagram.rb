class Diagram < ActiveRecord::Base

  belongs_to :user
  has_many :nodes
  has_many :lines
end
