require 'test_helper'

class FizzBuzzTest < ActiveSupport::TestCase
  def setup
    @fizz_buzz = FizzBuzz.new
  end

  test "1 to 1" do
    assert_equal("1", @fizz_buzz.convert(1))
  end 

  test "3 to Fizz" do
    assert_equal("Fizz", @fizz_buzz.convert(3))
  end 

  test "5 to Buzz" do
    assert_equal("Buzz", @fizz_buzz.convert(5))
  end 

  test "15 to FizzBuzz" do
    assert_equal("FizzBuzz", @fizz_buzz.convert(15))
  end 
  
  
end
