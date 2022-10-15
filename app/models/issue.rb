class Issue < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :title, length: {maximum: 80}, presence: true
  validates :description, length: {maximum: 300}
end
