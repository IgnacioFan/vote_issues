class User < ApplicationRecord
  has_many :issues, class_name: "Issue", foreign_key: "author_id"

  validates :name, length: {maximum: 80}, presence: true
end
