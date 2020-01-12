# frozen_string_literal: true

module Api
  module V1
    class UsersController < BaseController
      def index
        json_response(User.all)
      end

      def show
        user = User.find(params[:id])
        json_response(user)
      end
    end
  end
end
