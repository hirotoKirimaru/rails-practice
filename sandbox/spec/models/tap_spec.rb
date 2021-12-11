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
      p target

      target.tap do |t|
        t.start_date = Time.new(2008, 6, 21, 0, 0 , 0, "+09:00")
        t.end_date =   Time.new(2008, 7, 20, 0, 0 , 0, "+09:00")
      end


      is_expected.to eq true

      p target
      subject
    end

    # it '適当なfalse' do
    #   target = Term.new()

    #   expect(target.is_not_daily_rate_term?).to eq false
    # end
  end
end