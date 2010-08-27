require "wx"

include Wx

module DuperClock
  class Window < App
    attr_accessor :text
    attr_accessor :counter
    attr_accessor :ticker
	attr_accessor :time
    
    def on_init
      @counter = 0
	  @time = TimeModel.new
	  time.set_time(55,59,23)
      frame = Frame.new(nil, -1, "Reloj")
      self.text = StaticText.new(frame,-1,"")
	  print_time
      frame.show()
      
      @ticker = Ticker.new(self)
    end
    
    def tick!
      self.time.increment_second
      print_time
    end
	
	def print_time
		timestring = sprintf("%02d:%02d:%02d",time.hours,time.minutes,time.seconds)
		#"#{time.hours}:#{time.minutes}:#{time.seconds}"
		
		self.text.set_label(timestring)
	end
  end
end
