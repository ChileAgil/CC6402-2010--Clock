require 'chrono'
require 'test/unit'

class TestChrono < Test::Unit::TestCase
	def test_class_initialization
		chrono = nil
        assert_nothing_raised do
            chrono = Chrono.new()
		end
		assert_equal(false, chrono.is_running())
	end
	
	def test_start
		chrono = Chrono.new()
		chrono.start()
		assert_equal(true, chrono.is_running())
	end
	
	def test_stop
		chrono = Chrono.new()
		chrono.start()
		chrono.stop()
		assert_equal(false, chrono.is_running())
	end
	
	def test_reset
		chrono = Chrono.new()
		chrono.start()
		chrono.second_passed()
		chrono.reset()
		assert_equal(false, chrono.is_running())
		
		assert_equal("00:00:00", chrono.to_s())
	end

	
	def test_get_elapsed_time
		chrono = Chrono.new()
		assert_equal("00:00:00", chrono.to_s())
	end
	
	def test_second_passed
		chrono = Chrono.new()
		current_time = chrono.to_s()
		chrono.second_passed()
		assert_equal(current_time, chrono.to_s())
		
		chrono.start()
		chrono.second_passed()
		assert_not_equal(current_time, chrono.to_s())
	end
end