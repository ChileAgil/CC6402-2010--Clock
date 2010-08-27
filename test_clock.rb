require 'clock'
require 'test/unit'

class TestClock < Test::Unit::TestCase
    def test_class_initialization
        assert_nothing_raised do
            clock = Clock.new()
        end
    end

	def test_newclock
		c = Clock.new()
		assert_equal '00:00:00', c.to_s

		c = Clock.new(2, 35, 20)
		assert_equal '02:35:20', c.to_s
	end

	def test_settime
		c = Clock.new()
		c.set_time(1, 0, 0)
		assert_equal '01:00:00', c.to_s
        
	end

    def test_parsetime
        c = Clock.new()
        c.parse_time('23:59:59')
        assert_equal '23:59:59', c.to_s

        assert_raise ArgumentError do
            c.parse_time('23-59-59')
        end
        
        assert_raise ArgumentError do
            c.parse_time('23:59:a2')
        end

    end

    def test_secondpassed
        c = Clock.new()
        c.second_passed
        assert_equal '00:00:01', c.to_s
    end
    # tick
    # ver como string
end
