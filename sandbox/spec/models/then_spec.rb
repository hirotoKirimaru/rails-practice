require 'rails_helper'

RSpec.describe 'Thenの確認', type: :model do
  let(:target) { "Hello, world!" }
  
  describe '文字列での動作確認' do
    describe 'Thenの確認(yeild_selfのエイリアスメソッド)' do
      it 'HelloWorldを大文字にして、反転させる' do
        actual = target.then(&:upcase).then(&:reverse)
        expect(actual).to eq "!DLROW ,OLLEH"
      end   
    end
  
    describe 'Yield_selfの確認' do
      it 'HelloWorldを大文字にして、反転させる' do
        actual = target.yield_self(&:upcase).yield_self(&:reverse)
        expect(actual).to eq "!DLROW ,OLLEH"
      end 
    end
  end

  describe 'Timeの確認' do
    # disabledにするためのやり方
    # before { skip }

    describe 'Tapの確認' do
      it 'selfに値をセットしていないので1yearsされていない' do
        time = Time.new
        actual = time.tap{|t| t + 1.years}
        expect(actual.year).to eq time.year
      end   

      # ???????? どういうこと？
      # it 'selfに値をセットしているので1yearsされている' do
      #   time = Time.new
      #   actual = time.tap{|t| t = t+ 1.years}
      #   expect(actual.year).to eq time.year + 1
      # end   
    end

    describe 'Thenの確認' do
      it '値をセットしていないがthenのブロック結果を返却するので1yearsされている' do
        time = Time.new
        actual = time.then{|t| t + 1.years}
        expect(actual.year).to eq time.year + 1
      end   
    end
  end

end