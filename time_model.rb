class TimeModel
    
    SECONDS_OF_MINUTE = 60
    MINUTES_OF_HOUR = 60
    HOURS_OF_DAY = 24

    attr_reader :hours
    attr_reader :minutes
    attr_reader :seconds
    
    def initialize(hour = 0, minute = 0, second = 0)
        if (hour < 0 ) or (hour >= HOURS_OF_DAY)
           raise ArgumentError
        end
        if (minute < 0 ) or (minute >= MINUTES_OF_HOUR)
           raise ArgumentError
        end
        if (second < 0 ) or (second >= SECONDS_OF_MINUTE)
           raise ArgumentError
        end
        
        @hours = hour
        @minutes = minute
        @seconds = second
    end
    
    def current_time
        [@hours, @minutes, @seconds]
    end
    
    def second_passed
        @seconds = (@seconds+1)%SECONDS_OF_MINUTE
        if @seconds == 0
            minute_passed
        end
    end
    
    def minute_passed
        @minutes = (@minutes+1)%MINUTES_OF_HOUR
        if @minutes == 0
            hour_passed
        end
    end
    
    def hour_passed
        @hours = (@hours+1)%HOURS_OF_DAY
    end
    
    def to_s
        "%02d:%02d:%02d" % [@hours, @minutes, @seconds]
    end
end
