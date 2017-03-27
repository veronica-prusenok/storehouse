Figaro.require_keys('HOST', 'SMTP_FROM')

Figaro.require_keys('SMTP_HOST', 'SMTP_PORT', 'SMTP_PASSWORD', 'SMTP_USERNAME') if Rails.env.production?
