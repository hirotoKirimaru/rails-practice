require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    freeze_time
  end

  context 'ユーザクラスの作成' do
    it "同一作成時間になること" do
        # freeze_time

        old_user = User.new(id: 1, name: 'name', email: 'test@example.com', created_at: Time.now, updated_at: Time.now)
        new_user = User.new(id: 1, name: 'name', email: 'test@example.com', created_at: Time.now, updated_at: Time.now)

        expect(old_user.id).to eq(new_user.id)
        expect(old_user.name).to eq(new_user.name)
        expect(old_user.email).to eq(new_user.email)
        expect(old_user.created_at).to eq(new_user.created_at)
        expect(old_user.updated_at).to eq(new_user.updated_at)
    end 
  end
end
