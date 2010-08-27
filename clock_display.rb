require 'rubygems'
require "wx"
include Wx
# a new class which derives from the Wx::App class
class ClockDisplay < App
  # we're defining what the application is going to do when it starts
  def on_init  
    @clock = Clock.new
  
    @frame = Wx::Frame.new(nil, -1, 'OOA Clock')
    
    sizer = Wx::BoxSizer.new(Wx::VERTICAL)
    
    @label = Wx::StaticText.new(@frame, -1, '0')
    font = Wx::FontData.new.get_chosen_font
    font.set_point_size(32)
    font.set_weight(Wx::FONTWEIGHT_BOLD)
    @label.set_font(font)
    sizer.add(@label, 1, Wx::ALIGN_CENTER)
    
    @frame.set_sizer(sizer)
    @frame.show
    
    
    Wx::Timer.every(1000) {
      @clock.update
      @label.set_label(@clock.to_s)
    }
  end
end
# and this line makes it actually do it!
ClockDisplay.new.main_loop
