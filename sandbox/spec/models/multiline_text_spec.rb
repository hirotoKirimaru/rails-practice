require 'rails_helper'

RSpec.describe '複数行文字列の動作確認', type: :model do

  it '%|と<<~EOSの挙動確認' do
    actual =
      %|aiueo xyz
12345 EOS
|

    expected = <<~EOS
      aiueo xyz
      12345 EOS
    EOS
    
    p actual
    p expected

    expect(actual).to eq expected
  end

  it '%{と<<~EOSの挙動確認' do
    actual =
      %{aiueo xyz
12345 EOS
}

    expected = <<~EOS
      aiueo xyz
      12345 EOS
    EOS

    p actual
    p expected

    expect(actual).to eq expected
  end

  it '%|と<<~EOSの挙動確認(not)' do
    actual = %|
      aiueo xyz
      12345 EOS
    |

    expected = <<~EOS
      aiueo xyz
      12345 EOS
    EOS

    p actual
    p expected

    expect(actual).not_to eq expected
  end

end
