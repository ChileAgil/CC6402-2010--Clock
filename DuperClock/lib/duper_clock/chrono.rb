require "wx"

include Wx

module DuperClock
  class Chrono < Panel 
  attr_accessor :ticker
	attr_accessor :time
	attr_accessor :isRunning
	attr_accessor :button
	attr_accessor :btnReset
	attr_accessor :text
    
    def initialize(*args)
      super
	    @time = TimeModel.new
	    @isRunning = false
	    time.set_time(00,00,00)
      
	    @button = Button.new(self , -1 , 'Start' , Point.new(0,30))
	    @btnReset = Button.new(self , -1 , 'Reset' , Point.new(0,60))
	    self.evt_button(@button.get_id) do
	   	  lanzar_set_time	
	    end
	    self.evt_button(@btnReset.get_id) do
		    reset_time
	    end
	    
	    
	    self.text = StaticText.new(self,-1,"")
	    print_time
      
      
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
