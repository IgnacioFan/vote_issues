json.author do
  json.id issue.author.id
  json.name issue.author.name
end
json.title issue.title
json.description issue.description
json.votes issue.vote_issues do |vote_issue|
  json.partial! "vote_issue", vote_issue: vote_issue
end
