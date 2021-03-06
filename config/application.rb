require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mixed_Nuts
  class Application < Rails::Application
    # RSpec
    config.generators do |g|
      g.test_framework :minitest, spec: false, fixture: false
      g.fixture_replacement :factory_girl 
      # g.test_framework :rspec,
      #  fixtures: true,
      #  view_specs: false,
      #  helper_specs: true,
      #  routing_specs: false,
      #  controller_specs: true,
      #  request_specs: false
      #g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
