class Path < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  belongs_to :node
end
