require 'spec_helper'
require 'rails_helper'
RSpec.describe Viewer, type: :model do

    # setup
    let!(:user) { FactoryBot.create(:user)}
    let!(:cinema) { FactoryBot.create(:cinema)}
    let!(:sessions) { create_list(:session, 20, cinema_id: cinema.id) } 
    let!(:viewer1) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[0].id)}
    let!(:viewer2) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[1].id)}
    let!(:viewer3) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[2].id)}
    let!(:viewer4) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[3].id)}
    let!(:viewer5) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[4].id)}
    let!(:viewer6) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[5].id)}
    let!(:viewer7) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[6].id)}
    let!(:viewer8) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[7].id)}
    let!(:viewer9) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[8].id)}
    let!(:viewer10) { FactoryBot.create(:viewer, user_id: user.id, session_id: sessions[9].id)}
    describe "#bought_ticket" do
      it "10% discount" do
        expect(UsersCinema.find_by(user_id: user.id, cinema_id: cinema.id).discount).to eq(10)
      end
    end  
  end