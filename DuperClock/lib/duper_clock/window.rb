require "wx"

include Wx

module DuperClock
  class Window < App
    def frame_panel
      @frame_panel ||= begin
      @frame = Wx::Frame.new(nil, -1, 'Top Frame')
      panel = Wx::Panel.new(@frame)
      panel
      end
    end
    def frame_sizer
      @frame_sizer ||= begin
        sizer = Wx::VBoxSizer.new
        frame_panel.sizer = sizer
        sizer
      end
    end

    def notebook
      @notebook ||= begin
        notebook = Wx::Notebook.new(frame_panel)
        frame_sizer.add(notebook, 1, Wx::GROW)
        notebook
      end
    end
    
    def clock
      @clock ||= Clock.new(notebook)
    end 
    
    def chrono
      @chrono ||=Chrono.new(notebook)
    end
      
    def on_init
      notebook.add_page(clock, 'Reloj')
      notebook.add_page(chrono, 'Cronometro')
      @frame.show
    end
  end
end
