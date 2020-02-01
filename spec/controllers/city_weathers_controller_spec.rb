require 'rails_helper'

RSpec.describe CityWeathersController, type: :controller do

  describe "GET #weather" do
    it "returns http success" do
      get :weather
      expect(response).to have_http_status(:success)
    end
  end

end
