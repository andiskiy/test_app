# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :avatar, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
end
