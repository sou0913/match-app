if Rails.env == 'production'
  uri = URI.parse(Rails.application.credentials.redis[:production])
  Redis.current = Redis.new(host: uri.scheme, port: 6379)
else
  uri = URI.parse(Rails.application.credentials.redis[:development])
  Redis.current = Redis.new(host: uri.scheme, port: 6379)
end
