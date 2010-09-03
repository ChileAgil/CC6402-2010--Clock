require 'rubygems'
require "wx"
include Wx
# a new class which derives from the Wx::App class
class HelloWorld < App
  
  def frame_panel
    @frame_panel ||= (
      @frame = Wx::Frame.new(nil, -1, 'Top Frame')
      panel = Wx::Panel.new(@frame)
      panel
    )
  end
      
  def frame_sizer
    @frame_sizer ||= (
      sizer = Wx::VBoxSizer.new
      frame_panel.sizer = sizer
      sizer
    )
  end
  
  def notebook
    @notebook ||= (
      notebook = Wx::Notebook.new(frame_panel)
      frame_sizer.add(notebook, 1, Wx::GROW)
      notebook
    )
  end
  
  # we're defining what the application is going to do when it starts
  def on_init  
    
    @panel1 = Wx::Panel.new(notebook) #, -1, 'Panel 1')
    @panel2 = Wx::Panel.new(notebook) #, -1, 'Panel 2')

    @label1 = Wx::StaticText.new(@panel1, -1, 'Hello From Panel 1', 
      DEFAULT_POSITION, DEFAULT_SIZE, ALIGN_CENTER)
    @label2 = Wx::StaticText.new(@panel2, -1, 'Hello From Panel 2', 
      DEFAULT_POSITION, DEFAULT_SIZE, ALIGN_CENTER)
    
    @panel1_sizer = BoxSizer.new(VERTICAL)
    @panel1.set_sizer(@panel1_sizer)
    
    @panel2_sizer = BoxSizer.new(VERTICAL)
    @panel2.set_sizer(@panel2_sizer)
    
    @panel1_sizer.add(@label1, 0, GROW|ALL, 2)
    @panel2_sizer.add(@label2, 0, GROW|ALL, 2)
    
    
    notebook.add_page(@panel1, 'Panel 1')
    notebook.add_page(@panel2, 'Panel 2')
    
    @frame.show
    # @panel2.hide
    # first_frame = true
    
    # Wx::Timer.every(1000) {
    #   @panel1.show(!first_frame)
    #   first_frame = !first_frame
    #   if first_frame
    #     @frame1.hide
    #     @frame2.show
    #   else
    #     @frame1.show
    #     @frame2.hide
    #   end
    #   
    #   first_frame = !first_frame
    # }
  end
end
# and this line makes it actually do it!
HelloWorld.new.main_loop
