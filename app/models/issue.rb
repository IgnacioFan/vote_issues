class Issue < ApplicationRecord
  validates :title, length: {maximum: 80}, presence: true
  validates :description, length: {maximum: 300}
end
