# frozen_string_literal: true

module Api
  module V1
    module Account
      class SessionsController < Devise::SessionsController
        skip_before_action :verify_authenticity_token
        include ExceptionHandler

        private

        def respond_with(resource, _opts = {})
          render json: resource
        end

        def respond_to_on_destroy
          head :no_content
        end
      end
    end
  end
end
