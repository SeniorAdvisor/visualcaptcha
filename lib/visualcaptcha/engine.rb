require 'rails'
require 'visualcaptcha'

module VisualCaptcha
  class Engine < ::Rails::Engine
    initializer 'visual-captcha.setup', :after => 'less-rails.after.load_config_initializers', :group => :all do |app|
      app.config.less.paths << File.join(config.root, 'vendor', 'assets', 'stylesheets')
    end

    config.after_initialize do
      ActionView::Base.send(:include, VisualCaptcha::ViewHelper)
    end
  end
end
