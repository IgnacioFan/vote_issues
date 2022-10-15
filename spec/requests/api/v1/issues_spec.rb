require "rails_helper"

RSpec.describe "Api::V1::Issues", type: :request do
  let(:author) { create(:user) }
  let!(:issue) { create(:issue, author: author) }

  describe "GET /api/v1/issues" do
    it "returns http success" do
      get "/api/v1/issues"
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(
        {
          issues: [
            {
              author: {
                id: issue.author.id,
                name: issue.author.name
              },
              title: issue.title,
              description: issue.description
            }
          ]
        }.to_json
      )
    end
  end

  describe "POST /api/v1/issues" do
    it "returns http success" do
      post "/api/v1/issues", params: {issue: {title: "Test B", description: "Test descripiotn"}, user_id: author.id}
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(
        {
          author: {
            id: author.id,
            name: author.name
          },
          title: "Test B",
          description: "Test descripiotn"
        }.to_json
      )
    end

    context "invalid params" do
      it "returns 400 Bad Request" do
        post "/api/v1/issues", params: {issue: {title: "", description: "Test descripiotn"}, user_id: "1234"}
        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq(
          {
            error_message: "Couldn't find User with 'id'=1234"
          }.to_json
        )
      end

      it "returns 400 Bad Request" do
        post "/api/v1/issues", params: {issue: {title: "", description: "Test descripiotn"}, user_id: author.id}
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to eq(
          {
            error_message: "Validation failed: Title can't be blank"
          }.to_json
        )
      end
    end
  end

  describe "GET /api/v1/issues/:issue_id" do
    it "returns http success" do
      get "/api/v1/issues/#{issue.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(
        {
          author: {
            id: issue.author.id,
            name: issue.author.name
          },
          title: issue.title,
          description: issue.description
        }.to_json
      )
    end

    context "invalid params" do
      it "returns 400 Not Found" do
        get "/api/v1/issues/abc123"
        expect(response).to have_http_status(:not_found)
        expect(response.body).to eq(
          {
            error_message: "Couldn't find Issue with 'id'=abc123"
          }.to_json
        )
      end
    end
  end
end
