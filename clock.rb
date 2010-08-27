require 'time_model'

class Clock
	def initialize(h=0, m=0, s=0)
		@time = TimeModel.new(h, m, s)
	end
    
    def to_s()
        "%02d:%02d:%02d" % @time.current_time
    end
    
    def set_time(h=0, m=0, s=0)
        @time = TimeModel.new(h, m, s)
    end    
    
    def parse_time(str)
        time = str.split(':')
        if time.length != 3
            raise ArgumentError
        end
        time.map! {|x| Integer(x)}
        @time = TimeModel.new(time[0], time[1], time[2])
    end

    def second_passed()
        @time.second_passed
    end
end

