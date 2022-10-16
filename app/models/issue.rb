class Issue < ApplicationRecord
  has_many :vote_issues
  has_many :voters, through: :vote_issues, source: :user
  belongs_to :author, class_name: "User"

  validates :title, length: {maximum: 80}, presence: true
  validates :description, length: {maximum: 300}
end
