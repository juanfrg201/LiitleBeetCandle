require 'rails_helper'

RSpec.describe "SalePdfs", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/sale_pdfs/create"
      expect(response).to have_http_status(:success)
    end
  end

end
