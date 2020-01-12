# frozen_string_literal: true

module Users
  class Update < Save
    private

    def params
      return @params if @params.present?

      @params = context.params
      if @params[:password].blank?
        @params.delete(:password)
        @params.delete(:password_confirmation)
      end

      @params
    end
  end
end
