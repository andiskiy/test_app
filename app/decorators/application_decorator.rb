# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  def display_created_at
    h.l(created_at, format: :long)
  end

  def display_updated_at
    h.l(updated_at, format: :long)
  end

  def display_date(field)
    return if public_send(field).blank?

    h.l(public_send(field), format: :long)
  end
end
