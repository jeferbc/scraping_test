module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from OpenURI::HTTPError do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from Timeout::Error  do |e|
      json_response({ message: e.message }, :request_timeout)
    end
  end
end
