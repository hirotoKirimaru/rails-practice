require 'rails_helper'

RSpec.describe '複数行文字列の動作確認', type: :model do

  it '%|と<<~EOSの挙動確認' do
    actual =
      %|aiueo %d
12345
|

    expected = <<~EOS
      aiueo %d
      12345
    EOS
    
    p actual
    p expected

    expect(actual).to eq expected
  end

end
