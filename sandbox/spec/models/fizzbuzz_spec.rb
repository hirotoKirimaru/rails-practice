require 'rails_helper'

RSpec.describe 'FizzBuzzクラスの確認', type: :model do
  let(:target) {FizzBuzz.new}

  describe 'FizzBuzzの確認' do

    context 'subjectの動作確認' do
       
        subject {
            target.convert(1)   
        }

        it '1 to 1' do
            is_expected.to eq "1"
        end
    end

    context '普通のやりかた' do
        it '1 to 1' do
            expect(target.convert(1)).to eq "1"
        end
    end

    parameterized do
      where(:param, :expected, size: 8) do
        [
          [1 , "1"],
          [2 , "2"],
          [3 , "Fizz"],
          [5 , "Buzz"],
          [6 , "Fizz"],
          [10 , "Buzz"],
          [15 , "FizzBuzz"],
          [30 , "FizzBuzz"],
        ]
      end

      subject{ 
        target.convert(param) 
      }
  
      with_them do
        it do
          is_expected.to eq expected
        end
      end
    end
  end
end