require 'rails_helper'

RSpec.describe 'FizzBuzzクラスの確認', type: :model do
  let(:target) {FizzBuzz.new}

  describe 'リフレクションの確認' do
    it '1 to 1' do
        expect(target.convert(1)).to eq "1"
    end
  end
end