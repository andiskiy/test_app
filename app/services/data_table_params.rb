# frozen_string_literal: true

class DataTableParams
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def order_params
    return nil unless order_params_present?

    { order_column: order_column, order_direction: order_direction }
  end

  def order_column
    columns[order['column']]['data']
  end

  def order_direction
    order['dir']
  end

  def order
    return nil unless params[:order].present?

    @order ||= params[:order]['0']
  end

  def columns
    @columns ||= params['columns']
  end

  def order_params_present?
    order.present? && columns.present?
  end
end
