class User < ApplicationRecord
  has_many :issues, class_name: "Issue", foreign_key: "author_id"
  has_many :vote_issues
  has_many :voted_issues, through: :vote_issues, source: :issue

  validates :name, length: {maximum: 80}, presence: true
end
