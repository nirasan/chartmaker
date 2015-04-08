class Node < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  has_many :paths
end
