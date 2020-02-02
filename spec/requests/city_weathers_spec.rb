require 'rails_helper'

RSpec.describe 'City Weathers API', type: :request do
  describe 'POST /weather' do
    let(:request_body) { { city_id: '3454690' } }

    context 'when request attributes are valid' do
      before { post '/weather', params: request_body }

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
