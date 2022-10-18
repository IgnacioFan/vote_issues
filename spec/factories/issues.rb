FactoryBot.define do
  factory :issue do
    title { "Test A" }
    description { "Test description" }

    trait :with_author do
      author { create(:user, name: "Author Test") }
    end

    trait :with_vote_issues do
      transient do
        voter { create(:user) }
      end
      after(:create) do |issue, evaluator|
        create(:vote_issue, user: evaluator.voter, issue: issue)
      end
    end
  end
end
