# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate_user!
      respond_to :json

      include Response
      include ExceptionHandler
    end
  end
end
