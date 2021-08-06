# frozen_string_literal: true

class Common::V1::DepartmentsController < ApplicationApiController
  def index
    service = Common::GetDepartmentsService.new(nil)
    service.run!
    render json: service.results, serializer: Common::DepartmentsSerializer, status: :ok
  end
end
