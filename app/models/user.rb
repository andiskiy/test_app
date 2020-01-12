# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :avatar, presence: true, on: :update

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  mount_uploader :avatar, AvatarUploader
end
