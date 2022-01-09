module RescueHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_render({message: e.message}, status: :not_found)
    end

    rescue_from StandardError do |e|
      json_render({message: e.message}, status: :internal_server_error)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_render({message: e.record.errors}, status: :bad_request)
    end
  end
end