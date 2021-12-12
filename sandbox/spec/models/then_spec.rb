require 'rails_helper'

RSpec.describe 'Tap・Thenの確認', type: :model do
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
        actual = time.tap { |t| t + 1.years }
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
        actual = time.then { |t| t + 1.years }
        expect(actual.year).to eq time.year + 1
      end
    end
  end

  describe 'Termの確認' do
    # disabledにするためのやり方
    # before { skip }

    describe 'Tapの確認' do
      it 'selfに値をセットしていないので1yearsされていない' do
        term = Term.new
        time = Time.now

        actual = term.tap do |t|
          t.start_date = t.start_date + 1.years
        end
        # 副作用も起こす
        expect(term.start_date.year).to eq time.year + 1
        expect(term.end_date.year).to eq time.year

        # 返却もSelf
        expect(actual.start_date.year).to eq time.year + 1
        expect(actual.end_date.year).to eq time.year
      end
    end

    describe 'Thenの確認' do
      it '値をセットしていないがthenのブロック結果を返却するので1yearsされている' do
        term = Term.new
        time = Time.now

        actual = term.then do |t|
          t.start_date = t.start_date + 1.years
        end
        # 副作用も起こす
        expect(term.start_date.year).to eq time.year + 1
        expect(term.end_date.year).to eq time.year
        # 返却はブロックの結果(値のセットが最後なので、そうなる)
        expect(actual.year).to eq time.year + 1
      end
    end

    describe 'ThenとTapの確認' do
      it 'thenでcloneしてtapで値を変更する' do
        term = Term.new
        time = Time.now

        actual = term
                   .then(&:clone)
                   .tap { |t| t.start_date = t.start_date + 1.years }
        # cloneするからイミュータブルにする
        expect(term.start_date.year).to eq time.year
        expect(term.end_date.year).to eq time.year

        # cloneした結果をtapで返却する
        expect(actual.start_date.year).to eq time.year + 1
        expect(actual.end_date.year).to eq time.year
      end
    end
  end
end