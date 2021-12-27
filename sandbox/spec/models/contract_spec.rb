require 'rails_helper'

RSpec.describe Contract, type: :model do

  parameterized do
    # where(:a, :b, :answer, size: 3, focus_index: 1) do
    where(:contractDate, :expireDate, :answer, size: 15) do
      [
        [Time.new(2020, 12, 1), Time.new(2021, 3, 31), true],
        [Time.new(2020, 12, 1), Time.new(2021, 3, 30), false],
        [Time.new(2020, 12, 1), Time.new(2021, 2, 28), true],
        [Time.new(2020, 12, 1), Time.new(2024, 2, 29), true],
        [Time.new(2020, 12, 10), Time.new(2021, 12, 9), true],
        [Time.new(2020, 12, 10), Time.new(2021, 12, 10), false],
        [Time.new(2020, 2, 29), Time.new(2024, 11, 30), false],
        [Time.new(2020, 2, 29), Time.new(2024, 12, 31), false],
        [Time.new(2020, 11, 30), Time.new(2021, 3, 31), false],
        [Time.new(2020, 12, 31), Time.new(2021, 4, 30), true],
        [Time.new(2020, 12, 31), Time.new(2021, 3, 31), false],
        [Time.new(2020, 12, 31), Time.new(2021, 2, 28), true],
        [Time.new(2020, 12, 31), Time.new(2024, 2, 29), true],
        [Time.new(2020, 12, 30), Time.new(2024, 2, 28), false],
        [Time.new(2020, 12, 30), Time.new(2024, 2, 29), true]
      ]
    end

    subject { Contract.new(contractDate, expireDate).canExpire? }

    with_them do
      it do
        is_expected.to eq answer
      end
    end
  end
end
