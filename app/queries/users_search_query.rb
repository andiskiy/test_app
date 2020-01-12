# frozen_string_literal: true

class UsersSearchQuery
  attr_reader :params

  def initialize(scope = User, params = {})
    @scope = scope
    @params = params
  end

  def call
    @scope = @scope.where(users.grouping(generate_matches)) if query.present?
    @scope
  end

  private

  def generate_matches
    [
      users[:name].matches("%#{query}%"),
      users[:email].matches("%#{query}%")
    ].reduce { |clause, condition| Arel::Nodes::Or.new(clause, condition) }
  end

  def query
    params[:value]
  end

  def users
    User.arel_table
  end
end
