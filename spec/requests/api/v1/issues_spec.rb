require 'rails_helper'

RSpec.describe "Api::V1::Issues", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/issues/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/issues/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/issues/show"
      expect(response).to have_http_status(:success)
    end
  end
end
