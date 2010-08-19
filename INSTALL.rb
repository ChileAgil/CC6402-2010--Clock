#INSTALL Ruby
Seguir instrucciones en http://www.ruby-lang.org/en/downloads/

#INSTALL GEM
DOWNLOAD http://rubyforge.org/frs/download.php/70696/rubygems-1.3.7.tgz
Unpack and cd there
INSTALL: sudo ruby setup.rb

#INSTALL WXRuby
sudo gem install wxruby

#INSTALL Sinatra
sudo gem install sinatra
  #Tuve algunos problemas aquí por lo que tuve que:
  sudo gem uninstall rack -v 1.2.1
  sudo gem install rack -v 1.1.
