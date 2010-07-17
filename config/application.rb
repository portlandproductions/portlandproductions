# Boot Rails
require File.join(File.dirname(__FILE__), 'boot')

# Here we load in Refinery to do the rest of the heavy lifting.
# Refinery is setup in config/preinitializer.rb
require Refinery.root.join("lib", "refinery_initializer").cleanpath.to_s

# Boot with Refinery. Most configuration is handled by Refinery.
# Anything you specify here that Refinery specified internally will override Refinery.
Refinery::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  config.action_controller.session = {
    :key    => '_refinery_session',
    :secret => '18660f8788c8020f9e3d3bf6620a551b7d0b1da38863b0c3c2b061e9741e6fc486a579586ce71ff06d95e34177d66d0ce39d31c8ddaf53ae91955d70'
  }

end

# You can set things in the following file and we'll try hard not to destroy them in updates, promise.
# Note: These are settings that aren't dependent on environment type. For those, use the files in config/environments/
require Rails.root.join('config', 'settings.rb').to_s

# Bundler has shown a weakness using Rails < 3 so we are going to
# require these dependencies here until we can find another solution or until we move to
# Rails 3.0 which should fix the issue (or until Bundler fixes the issue).
require_dependency 'will_paginate'
