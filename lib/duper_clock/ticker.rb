module DuperClock
  class Ticker
    attr_accessor :receiver
    
    def initialize(receiver)
      self.receiver = receiver
      self.start!
    end
    
    protected
      def start!
        Wx::Timer.every(1000) do
          receiver.tick!
        end 
      end
  end
end
