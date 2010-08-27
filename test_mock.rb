require 'test/unit'
require 'DuperClock/lib/duper_clock/clock.rb'

class ClockTest < Test::Unit::TestCase
  def test_the_truth
    assert true
  end
  
  def testIncrementoSegundo
	assert true
	clock = Clock.new()
	t0 = clock.getSeconds()
	clock.incrementSeconds()
	t1 = clock.getSeconds()
	assert(t0 + 1 == t1, "The time wasn't increment well")
  end
end
