# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def display_user_link
    h.link_to(name, h.user_path(model))
  end

  def generate_i18n(class_name, key, value)
    h.content_tag(:span) { I18n.t("activerecord.attributes.#{class_name.model_name.i18n_key}.#{key}") } +
      h.content_tag(:span) { value }
  end

  def display_avatar
    src = avatar.thumb.file.exists? ? avatar.thumb.url : avatar.url
    h.content_tag(:img, alt: 'avatar', class: 'rounded-circle', src: src) {}
  end
end
