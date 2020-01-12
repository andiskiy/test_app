# frozen_string_literal: true

module Response
  def json_response(obj, status = :ok)
    render json: { data: obj }, status: status
  end

  def render_resource(resource)
    if resource.valid?
      render json: { status: :success, data: resource }, status: :ok
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      status: :error,
      errors: resource.errors
    }, status: :unprocessable_entity
  end
end
