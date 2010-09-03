require 'rubygems'
require "wx"
require 'clock'
#require 'chrono'
include Wx

class ClockDisplay < Wx::App

   def on_init
    @clock = Clock.new
    #@crono = Chrono.new
   
     frame = Wx::Frame.new( nil, -1, 'Tabs Demo' )
     frame.set_client_size( Wx::Size.new( 400, 180 ) )

     notebook = Wx::Notebook.new( frame, -1)
     
     # First panel
     
    panel = Wx::Panel.new( notebook, -1 )
    sizer = Wx::BoxSizer.new(Wx::VERTICAL)
    panel.set_sizer sizer
              
    @clock_label = Wx::StaticText.new(panel, -1, '00:00:00')
    @clock_button = Wx::Button.new(panel, -1, 'Cambiar la hora')
    font = Wx::FontData.new.get_chosen_font
    font.set_point_size(32)
    font.set_weight(Wx::FONTWEIGHT_BOLD)
    @clock_label.set_font(font)
    sizer.add(@clock_label,  0, GROW|ALL, 2)
    sizer.add(@clock_button,  0, GROW|ALL, 2)
    
    notebook.add_page( panel, "Reloj" )
    
    # Second panel
    
    panel_cron = Wx::Panel.new( notebook, -1 )
    sizer_cron = Wx::BoxSizer.new(Wx::VERTICAL)
    panel_cron.set_sizer sizer_cron
    
    @cron_label = Wx::StaticText.new(panel_cron, -1, '00:00:00')
    font = Wx::FontData.new.get_chosen_font
    font.set_point_size(32)
    font.set_weight(Wx::FONTWEIGHT_BOLD)
    @cron_label.set_font(font)
    sizer_cron.add(@cron_label,  0, GROW|ALL, 2)
    
    @cron_startstop = Wx::Button.new(panel_cron, -1, 'Start')
    @cron_reset = Wx::Button.new(panel_cron, -1, 'Reset')
    sizer_cron.add(@cron_startstop,  0, GROW|ALL, 2)
    sizer_cron.add(@cron_reset,  0, GROW|ALL, 2)
    
    notebook.add_page( panel_cron, "Cronómetro" )


     frame.show
     
     # Eventos
     evt_button(@clock_button) {
        @text_entry=Wx::TextEntryDialog.new(frame, 'Ingrese la nueva hora', 
                    'bla', 
                    '00:00:00', 
                    OK|CANCEL, 
                    DEFAULT_POSITION)
        if @text_entry.show_modal == ID_OK
            begin
                @clock.parse_time(@text_entry.get_value)
            rescue ArgumentError
                puts "ERROR"
            end
        end
    }
    
    evt_button(@cron_startstop) {
        if (@crono.is_running)
            @crono.stop
            @cron_startstop.set_label('Start')
        else
            @crono.start
            @cron_startstop.set_label('Stop')                 
        end
    }
    evt_button(@cron_reset) {
        @crono.reset()
        if (@crono.is_running)
             @cron_startstop.set_label('Stop')
        else
             @cron_startstop.set_label('Start') 
        end
    }
    
    
    Wx::Timer.every(1000) {
      @clock.second_passed
      @clock_label.set_label(@clock.to_s)
      #@crono.second_passed
      #@cron_label.set_label(@crono.to_s)
    }
   end

end

if __FILE__ == $0
   ClockDisplay.new.main_loop()
end



