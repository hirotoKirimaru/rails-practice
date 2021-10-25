require 'rails_helper'

RSpec.describe 'リフレクションクラスの確認', type: :model do
  let(:reflection) {Reflection.new}

  describe 'リフレクションの確認' do
    context 'houseを呼び出す' do
        it "houseを呼び出す" do
            expect(reflection.public_send("house")).to eq "house"
        end 
      end
  end
end