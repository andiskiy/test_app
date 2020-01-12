# frozen_string_literal: true

module Users
  class Save
    include Interactor

    delegate :user, to: :context

    def call
      user.model.assign_attributes(params)
      context.fail!(errors: user.errors) unless user.validate(params)

      user.save!
    end

    private

    def params
      @params = context.params
    end
  end
end
