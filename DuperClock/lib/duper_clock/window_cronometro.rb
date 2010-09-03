require "wx"

include Wx

module DuperClock
  class WindowCronometro < App
    attr_accessor :ticker
	attr_accessor :time
	attr_accessor :isRunning
	attr_accessor :button
	attr_accessor :btnReset
    
    def on_init
	  @time = TimeModel.new
	  @isRunning = false
	  time.set_time(00,00,00)
      frame = Frame.new(nil, -1, "Cronometro")
	@button = Button.new(frame , -1 , 'Start' , Point.new(0,30))
	@btnReset = Button.new(frame , -1 , 'Reset' , Point.new(0,60))
	frame.evt_button(@button.get_id) do
		lanzar_set_time	
	end
	frame.evt_button(@btnReset.get_id) do
		reset_time
	end
	  print_time
      frame.show()
      
      @ticker = Ticker.new(self)
    end
    
    def tick!
		if isRunning
			self.time.increment_second
			print_time
		end
    end
	
	def print_time
		timestring = sprintf("%02d:%02d:%02d",time.hours,time.minutes,time.seconds)
		#"#{time.hours}:#{time.minutes}:#{time.seconds}"
		
		self.text.set_label(timestring)
	end

	def lanzar_set_time
		if @isRunning
			@isRunning = false
			button.set_label('Start')
		else
			@isRunning = true
			button.set_label('Stop')
		end
	end
	
	def reset_time
		@time.set_time(00,00,00)
		@isRunning = false
		button.set_label('Start')
		print_time
	end
  end
end
