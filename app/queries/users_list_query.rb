# frozen_string_literal: true

class UsersListQuery
  attr_reader :scope, :params

  def initialize(scope = User, params = {})
    @scope = scope
    @params = params
  end

  def call
    order_scope
  end

  private

  def order_scope
    if order_params.present?
      @scope.order(users[order_params[:order_column]].send(order_params[:order_direction]))
    else
      @scope.order(users[:id].desc)
    end
  end

  def order_params
    params[:order_params]
  end

  def users
    User.arel_table
  end
end
