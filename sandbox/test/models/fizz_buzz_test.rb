require 'test_helper'

class FizzBuzzTest < ActiveSupport::TestCase
  def setup
    @fizz_buzz = FizzBuzz.new
  end

  test "1 to 1" do
    assert_equal("1", @fizz_buzz.convert(1))
  end 

  
end
