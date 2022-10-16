class Api::V1::IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:author, vote_issues: :user).all
    render json: {
      issues: @issues.map { |issue|
        {
          author: {
            id: issue.author.id,
            name: issue.author.name
          },
          title: issue.title,
          description: issue.description,
          votes: issue.vote_issues.map { |vote_issue|
            {
              id: vote_issue.user.id,
              name: vote_issue.user.name,
              attitude: vote_issue.attitude
            }
          }
        }
      }
    }, status: :ok
  end

  def create
    @issue = current_user.issues.create!(issue_params)
    render json: {
      author: {
        id: current_user.id,
        name: current_user.name
      },
      title: @issue.title,
      description: @issue.description
    }, status: :ok
  end

  def show
    @issue = Issue.includes(vote_issues: :user).find(params[:id])
    render json: {
      author: {
        id: @issue.author.id,
        name: @issue.author.name
      },
      title: @issue.title,
      description: @issue.description,
      votes: @issue.vote_issues.map { |vote_issue|
        {
          id: vote_issue.user.id,
          name: vote_issue.user.name,
          attitude: vote_issue.attitude
        }
      }
    }, status: :ok
  end

  def vote
    vote_issue = VoteIssue.find_or_create_by(issue_id: params[:id], user_id: params[:user_id])
    vote_issue.update!(attitude: params[:vote])
    render json: {
      vote: {
        issue_id: vote_issue.issue_id,
        user_id: vote_issue.user_id,
        attitude: vote_issue.attitude
      }
    }, status: :ok
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end

  def current_user
    User.find(params[:user_id])
  end
end
