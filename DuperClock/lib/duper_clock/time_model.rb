module DuperClock
	class TimeError < RuntimeError
	end
	class TimeModel
		def initialize
			@minutes = 0 
			@seconds = 0
			@hours = 0
		end
		
		def increment_second
			self.seconds = self.seconds + 1
		end
		
		def increment_minute
			self.minutes = self.minutes + 1
		end
		
		def increment_hour
			self.hours = self.hours + 1
		end
		
		def hours
			@hours
		end
		
		def seconds
			@seconds
		end
		
		def minutes
			@minutes
		end
		
		def set_time(seconds, minutes, hours)
			self.seconds = seconds
			self.minutes = minutes
			self.hours = hours
		end
		
		def seconds=(seconds)
			case seconds
			when 0..59 then @seconds = seconds
			when 60
				@seconds = 0
				increment_minute
			else
				raise TimeError
			end
		end
		
		def minutes=(minutes)
			case minutes
			when 0..59 then @minutes = minutes
			when 60
				@minutes = 0
				increment_hour
			else
				raise TimeError
			end
		end
		
		def hours=(hours)
			case hours
			when 0..23 then @hours = hours
			when 24
				@hours = 0
			else
				raise TimeError
			end
		end
	end
end