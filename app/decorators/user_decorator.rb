# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def display_user_link
    link_name = name.present? ? name : email
    h.link_to(link_name, h.admin_user_path(model))
  end

  def generate_i18n(class_name, key, value)
    h.content_tag(:span) { I18n.t("activerecord.attributes.#{class_name.model_name.i18n_key}.#{key}") } +
      h.content_tag(:span) { value }
  end

  def display_avatar
    if avatar?
      src = avatar.thumb.file.exists? ? avatar.thumb.url : avatar.url
      h.content_tag(:img, alt: 'avatar', class: 'rounded-circle', src: src) {}
    else
      h.content_tag(:img, alt: 'avatar', class: 'rounded-circle', src: 'https://via.placeholder.com/500') {}
    end
  end
end
