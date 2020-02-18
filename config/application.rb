require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module ReRequestAnAwsAccount
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.system_tests = nil
    config.action_view.field_error_proc = Proc.new { |html_tag| html_tag }

    # Set a css_compressor so sassc-rails does not overwrite the compressor when running 
    # workaround until https://github.com/sass/libsass/milestone/35 is shipped
    config.assets.css_compressor = nil
  end
end
