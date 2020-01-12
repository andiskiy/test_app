# frozen_string_literal: true

module Users
  class Update
    include Interactor

    delegate :user, to: :context

    def call
      user.assign_attributes(params)
      context.fail!(errors: user.errors) unless user.valid?

      user.save!
    end

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
