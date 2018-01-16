module Response
  def json_response(object, status = :ok)
    render json: object, serializer: serializer(object), status: status
  end

  private

  def serializer(object)
    "#{object.class.name}Serializer".safe_constantize
  end
end
