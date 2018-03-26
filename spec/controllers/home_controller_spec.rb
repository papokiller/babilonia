require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      expect(Torrent).to receive(:torrent_waiting_for_download)
        .and_return({})
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
