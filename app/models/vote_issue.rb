class VoteIssue < ApplicationRecord
  VOTE_ATTITUDE = %w[agree disagree].freeze

  belongs_to :user
  belongs_to :issue

  validates :attitude, inclusion: {in: VOTE_ATTITUDE, message: "%{value} is a invalid value"}
end
