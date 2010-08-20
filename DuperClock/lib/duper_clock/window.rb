require "wx"

include Wx

module DuperClock
  class Window < App
    attr_accessor :text
    attr_accessor :counter
    attr_accessor :ticker
    
    def on_init
      @counter = 0
      frame = Frame.new(nil, -1, "Hello World")
      self.text = StaticText.new(frame,-1,counter.to_s)
      frame.show()
      
      @ticker = Ticker.new(self)
    end
    
    def tick!
      self.counter = counter + 1
      self.text.set_label(counter.to_s)
    end
  end
end
