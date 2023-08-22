require 'rails_helper'

RSpec.describe "Viewers", type: :request do
  describe "PUT /update_status" do
    it "update_status" do
      session = FactoryBot.create(:session)
      viewer = FactoryBot.create(:viewer, session_id: session.id, booking: true, bought: false)
      put "/viewers/update_status?ids[]=#{viewer.id}&bought=true"
      expect(Viewer.find(viewer.id).bought).to eq(true)
    end
  end
end