class Api::V1::IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:author, vote_issues: :user).all
    render :index, status: :ok
  end

  def create
    @issue = current_user.issues.create!(issue_params)
    render :create, status: :ok
  end

  def show
    @issue = Issue.includes(vote_issues: :user).find(params[:id])
    render :show, status: :ok
  end

  def vote
    @vote_issue = VoteIssue.find_or_create_by(issue_id: params[:id], user_id: params[:user_id])
    @vote_issue.update!(attitude: params[:vote])
    render :vote, status: :ok
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end

  def current_user
    User.find(params[:user_id])
  end
end
