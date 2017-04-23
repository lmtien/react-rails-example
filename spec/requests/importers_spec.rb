require 'rails_helper'

RSpec.describe "Importers", type: :request do
  describe "GET /importers" do
    it "works! (now write some real specs)" do
      get importers_path
      expect(response).to have_http_status(200)
    end
  end
end
