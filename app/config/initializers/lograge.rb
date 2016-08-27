Rails.application.configure do
  config.lograge.formatter = Lograge::Formatters::Logstash.new
  config.lograge.logger = ActiveSupport::Logger.new(STDOUT)

  config.lograge.custom_options = lambda do |event|
    {
      request_ip: event.payload[:request_ip]
    }
  end
end
