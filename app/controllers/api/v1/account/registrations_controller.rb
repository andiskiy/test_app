# frozen_string_literal: true

module Api
  module V1
    module Account
      class RegistrationsController < Devise::RegistrationsController
        protect_from_forgery with: :null_session
        before_action :configure_account_update_params, only: :update
        skip_before_action :verify_authenticity_token, only: :create

        include Response
        include ExceptionHandler

        def edit
          json_response(resource)
        end

        def create
          build_resource(sign_up_params)

          resource.save
          render_resource(resource)
        end

        def update
          result = Users::Update.call(user: current_user, params: account_update_params)
          render_resource(result.user)
        end

        protected

        def configure_account_update_params
          devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
        end
      end
    end
  end
end
