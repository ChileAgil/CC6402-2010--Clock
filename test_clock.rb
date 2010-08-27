require 'clock'
require 'test/unit'

class TestClock < Test::Unit::TestCase
    def test_class_initialization
        assert_nothing_raised do
            clock = Clock.new
        end
    end
    
    # tick
    # ver como string
end
