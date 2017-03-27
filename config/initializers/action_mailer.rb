mailer_options = { host: ENV.fetch('HOST') }
mailer_options[:port] = ENV.fetch('PORT').to_i if ENV.key?('PORT') && !Rails.env.production?

Rails.application.config.action_mailer.default_url_options = mailer_options
