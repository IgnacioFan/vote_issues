class Api::V1::IssuesController < ApplicationController
  def index
    @issues = Issue.all
    render json: {
      issues: @issues.map { |issue|
        {
          id: issue.id,
          title: issue.title,
          description: issue.description
        }
      }
    }, status: :ok
  end

  def create
    @issue = Issue.create!(issue_params)
    render json: {
      title: @issue.title,
      description: @issue.description
    }, status: :ok
  rescue => e
    render json: {
      error_message: "Something wrong!"
    }, status: 404
  end

  def show
    @issue = Issue.find(params[:id])
    render json: {
      id: @issue.id,
      title: @issue.title,
      description: @issue.description
    }, status: :ok
  rescue => e
    render json: {
      error_message: "Something wrong!"
    }, status: 404
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
