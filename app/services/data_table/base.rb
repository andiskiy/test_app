# frozen_string_literal: true

module DataTable
  class Base
    def initialize(scope, params)
      @scope = scope
      @params = params
      @total_count = @scope.count
      @scope = @scope.offset(@params[:start].to_i).limit(@params[:length].to_i)
    end

    def prepare_json
      data = @scope.map { |item| row(item) }
      { recordsTotal: @total_count, recordsFiltered: @total_count, data: data }
    end
  end
end
