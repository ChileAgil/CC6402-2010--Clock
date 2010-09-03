require 'time_model'

class Chrono
	attr_reader :is_running
	def initialize()
		@time = TimeModel.new()
		@is_running = false
	end
	
	def start()
		@is_running = true
	end
	
	def stop()
		@is_running = false
	end
	
	def reset()
		stop()
		@time = TimeModel.new()
	end
	
	def to_s()
		"%02d:%02d:%02d" % @time.current_time
	end
	
	def second_passed()
		if (is_running())
			@time.second_passed
		end
    end
	
end