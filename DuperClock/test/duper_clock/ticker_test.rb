require 'test_helper'

class TickerTest < Test::Unit::TestCase
  def test_the_truth
    ticker = DuperClock::Ticker.new
    sleep(10)
    assert_equal 10, ticker.getSeconds()
    sleep(55)
    assert_equal 5, ticker.getSeconds()
  end
end
