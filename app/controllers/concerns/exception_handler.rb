module ExceptionHandler extend ActiveSupport::Concern
  require 'open-uri'

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from OpenURI::HTTPError do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from Timeout::Error  do |e|
      json_response({ message: e.message }, :request_timeout)
    end

    rescue_from ActiveRecord::RecordInvalid  do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end
