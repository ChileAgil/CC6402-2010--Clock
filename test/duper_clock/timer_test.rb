require 'test_helper'
require 'duper_clock/time_model'

class TimerTest < Test::Unit::TestCase
  def test_the_truth
    assert true
  end
  
  def test_creation
	myTime = DuperClock::TimeModel.new
	#Verificamos que se inicie en cero
	assert_equal 0, myTime.seconds
	assert_equal 0, myTime.hours
	assert_equal 0, myTime.minutes
  end
  
  def test_increment_second
	myTime = DuperClock::TimeModel.new
	initialSeconds = myTime.seconds
	myTime.increment_second()
	result = myTime.seconds - initialSeconds
	assert_equal 1, result
	assert_equal 0, myTime.hours
	assert_equal 0, myTime.minutes
  end
  
  def test_set_time
	myTime = DuperClock::TimeModel.new
	myTime.set_time(2, 1, 3)
	assert_equal 2, myTime.seconds
	assert_equal 1, myTime.minutes
	assert_equal 3, myTime.hours
  end
  
  def test_increment_minute
	myTime = DuperClock::TimeModel.new
	myTime.set_time(59, 0, 0)
	myTime.increment_second
	assert_equal 0, myTime.seconds
	assert_equal 1, myTime.minutes
	assert_equal 0, myTime.hours
  end
  
  def test_increment_hour
	myTime = DuperClock::TimeModel.new
	myTime.set_time(59, 59, 0)
	initialHours = myTime.hours;
	myTime.increment_second
	result = myTime.hours - initialHours
	assert_equal 1, result
	assert_equal 0, myTime.minutes
	assert_equal 0, myTime.seconds
  end
  
  def test_increment_day
	myTime = DuperClock::TimeModel.new
	myTime.set_time(59, 59, 23)
	myTime.increment_second
	assert_equal 0, myTime.hours
	assert_equal 0, myTime.minutes
	assert_equal 0, myTime.seconds
  end
  
  def test_invalide_time
	myTime = DuperClock::TimeModel.new
	assert_raises(DuperClock::TimeError) do
		myTime.seconds= 100
	end
	assert_raises(DuperClock::TimeError) do
		myTime.minutes= 89
	end
	assert_raises(DuperClock::TimeError) do
		myTime.hours= 76
	end
  end
end