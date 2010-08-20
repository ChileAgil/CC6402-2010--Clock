module DuperClock
  class Ticker
    def initialize()
        @start_time = Time.now
    end
    def getSeconds()
      return (Time.now.to_i - @start_time.to_i) % 60
    end
  end
end
