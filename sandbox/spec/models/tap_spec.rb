require 'rails_helper'

RSpec.describe 'Tapの確認', type: :model do
  let!(:target){
    Term.new()
  }
  describe 'Tapの確認' do
    subject{
      target.is_not_daily_rate_term?
    }


    it '適当なtrue' do
      # target = Term.new()
# 
      # expect(target.is_not_daily_rate_term?).to eq true    
      is_expected.to eq true
      subject
    end

    # it '適当なfalse' do
    #   target = Term.new()

    #   expect(target.is_not_daily_rate_term?).to eq false
    # end
  end
end