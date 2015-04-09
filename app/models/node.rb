class Node < ActiveRecord::Base
  belongs_to :user
  belongs_to :diagram
  has_many :lines

  validates :description,
      presence: true,
      length: {minimum: 1}
end
