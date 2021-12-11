require 'rails_helper'

RSpec.describe 'Tapの確認', type: :model do
  describe 'Tapの確認' do
    it '適当なtrue' do
      target = Term.new()

      expect(target.is_not_daily_rate_term?).to eq true    
    end

    # it '適当なfalse' do
    #   target = Term.new()

    #   expect(target.is_not_daily_rate_term?).to eq false
    # end
  end
end