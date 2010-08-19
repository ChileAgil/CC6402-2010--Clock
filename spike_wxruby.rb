require 'rubygems'
require "wx"
include Wx
# a new class which derives from the Wx::App class
class HelloWorld < App
  # we're defining what the application is going to do when it starts
  def on_init  
    # it's going to make a frame entitled "Hello World"
    helloframe = Frame.new(nil, -1, "Hello World")
    # it's going to put the text "Hello World" in that frame
    StaticText.new(helloframe,-1,"Hello World")
    # and then it's going to make the window appear
    helloframe.show()
  end
end
# and this line makes it actually do it!
HelloWorld.new.main_loop