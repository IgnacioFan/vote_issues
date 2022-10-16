class CreateVoteIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_issues, id: :uuid do |t|
      t.references :issue, type: :uuid, null: false
      t.references :user, type: :uuid, null: false
      t.string :attitude
      t.timestamps
    end
  end
end
