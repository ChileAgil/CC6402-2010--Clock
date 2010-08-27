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
	button = Button.new(frame , -1 , 'Cambiar Hora' , Point.new(0,30))
	frame.evt_button(button.get_id) do
		lanzar_set_time	
	end
	
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

	def lanzar_set_time
		frame_set = Frame.new(nil, -1, "Ingreso hora")
		text_h = TextCtrl.new(frame_set , -1 , "" , Point.new(0,0) , Size.new(25,25) )
		text_m = TextCtrl.new(frame_set , -2 , "" , Point.new(30,0) , Size.new(25 ,25)  )
		text_s = TextCtrl.new(frame_set , -3 , "" , Point.new(60,0) , Size.new(25,25) )
		button = Button.new(frame_set , -1 , 'Cambiar Hora' , Point.new(0,30))
		frame_set.evt_button(button.get_id) do
		@time.set_time(text_s.get_value.to_i , text_m.get_value.to_i , text_h.get_value.to_i)
		print_time
		end
		frame_set.show
	end
  end
end
