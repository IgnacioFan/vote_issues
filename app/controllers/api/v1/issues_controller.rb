class Api::V1::IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:author).all
    render json: {
      issues: @issues.map { |issue|
        {
          author: {
            id: issue.author.id,
            name: issue.author.name
          },
          title: issue.title,
          description: issue.description
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
    @issue = Issue.find(params[:id])
    render json: {
      author: {
        id: @issue.author.id,
        name: @issue.author.name
      },
      title: @issue.title,
      description: @issue.description
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
