class turboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(format: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
      elsif has_error? && default_action
        render rendering_options.merge(format: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
