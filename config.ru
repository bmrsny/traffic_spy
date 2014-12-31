current_path = File.expand_path('lib')                           # => nil
$LOAD_PATH.push(current_path) unless $LOAD_PATH.include?($LOAD_PATH)  # => ["/Users/Jwan/.rvm/gems/ruby-2.1.3/gems/seeing_is_believing-2.1.4/lib", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/site_ruby", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby/2.1.0/x86_64-darwin13.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/vendor_ruby", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0", "/Users/Jwan/.rvm/rubies/ruby-2.1.3/lib/ruby/2.1.0/x86_64-darwin13.0", "/lib"]

require 'bundler'  # => true
Bundler.require    # ~> Bundler::GemfileNotFound: Could not locate Gemfile

require 'traffic_spy'
run TrafficSpy::Server

# >> /lib

# ~> Bundler::GemfileNotFound
# ~> Could not locate Gemfile
# ~>
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler/shared_helpers.rb:26:in `default_gemfile'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:249:in `default_gemfile'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:194:in `root'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:101:in `bundle_path'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:401:in `configure_gem_home_and_path'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:92:in `configure'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:153:in `definition'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:118:in `setup'
# ~> /Users/Jwan/.rvm/gems/ruby-2.1.3/gems/bundler-1.7.9/lib/bundler.rb:134:in `require'
# ~> /Users/Jwan/Dropbox/Turing/Projects/traffic_spy/config.ru:5:in `<main>'
