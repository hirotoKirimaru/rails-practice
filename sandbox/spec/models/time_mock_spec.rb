require 'rails_helper'

RSpec.describe 'Timeクラスの動作確認', type: :model do
  let(:_20200101) { Time.new(2020, 1, 1, 0, 0, 0) }
  let(:_20210101) { Time.new(2021, 1, 1, 0, 0, 0) }

  describe "呼び出す回数ごとに処理する内容を変更する" do
    before do
      allow(Time).to receive(:now)
                       .and_return(_20200101, _20210101)
    end
    it "1回目、2回目以降は引数の違いで異なる値が返却される。3回目と4回目は一致していること" do
      expect(Time.now).not_to eq(Time.now)
      expect(Time.now).to eq(Time.now)
    end
  end
  
  describe "Time.nowのモック(receive_message_chain)" do
    before do
      allow(Time).to receive_message_chain(:now)
                       .and_return(_20200101)
    end
    it "メソッドチェーンでモックにする(多用はデメテルの法則違反していることに気づけないかも)" do
      expect(Time.now).to eq(Time.now)
    end
  end

  describe "Time.nowのモック(receive)" do
    before do
      allow(Time).to receive(:now)
                       .and_return(_20200101)
    end

    it "モックにするとき" do
      expect(Time.now).to eq(Time.now)
    end
  end

  context 'なにもしない' do
    it "同一作成時間にならないこと" do
      expect(Time.now).not_to eq(Time.now)
    end
  end
  
  context 'freeze_time' do
    before { freeze_time }
    it "同一作成時間になること" do
      expect(Time.now).to eq(Time.now)
    end
  end

  context 'travelとtravel_to' do
    before { travel_to(_20200101)}
    it "同一作成時間になること" do
      expect(Time.now).to eq(Time.now)
    end

    it "travelして時間をずらすこと" do
      now = Time.now
      travel 1.years
      now2 = Time.now

      expect(now).not_to eq(now2)
      expect(now).to eq(_20200101)
      expect(now2).to eq(_20210101)
    end
  end
end
