require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module IsbnProject
  class Application < Rails::Application
    config.load_defaults 5.1

    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.eager_load_paths << Rails.root.join('lib')
  end
end
