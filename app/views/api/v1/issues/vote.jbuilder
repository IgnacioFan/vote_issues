json.vote do
  json.issue_id @vote_issue.issue_id
  json.user_id @vote_issue.user_id
  json.attitude @vote_issue.attitude
end
