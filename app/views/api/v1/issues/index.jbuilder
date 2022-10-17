json.issues @issues do |issue|
  json.partial! "issue", issue: issue
end
