# frozen_string_literal: true

class Common::V1::DepartmentsController < ApplicationApiController
  include TugoCommon::RequestHandler::AuthRestHeaderHandler

  def index
    service = Common::GetDepartmentsService.new(auth_header)
    service.run!
    render json: service.results, serializer: Common::DepartmentsSerializer, status: :ok
  end
end
