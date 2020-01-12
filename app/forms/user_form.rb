# frozen_string_literal: true

class UserForm < Reform::Form
  properties :name, :email, :avatar, :password, :password_confirmation

  validates :name, :avatar, presence: true
  validate :devise_field_validate

  def devise_field_validate
    model.valid?
    model.errors.each do |key, message|
      errors.add(key, message)
    end
  end
end
