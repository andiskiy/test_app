# frozen_string_literal: true

module ApplicationHelper
  def body_data_page
    (params[:controller].split('/') << action_name).map(&:camelize).join
  end
end
