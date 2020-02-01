require 'rails_helper'

RSpec.describe 'City Weathers API', type: :request do
  describe 'POST /weather' do
    let(:request_body) { { city_id: '3454690' } }

    it "returns http created" do
      post :weather, request_body
      expect(response).to have_http_status(:created)
    end
  end
end
