# frozen_string_literal: true

class Common::V1::RolesController < ApplicationApiController
  include TugoCommon::RequestHandler::AuthRestHeaderHandler

  def index
    service = Common::GetRolesService.new(auth_header)
    service.run!
    render json: service.results, serializer: Common::RolesSerializer, status: :ok
  end

  def show
    request_params = Common::ShowRoleRequestParams.new(params)
    request_params.validate!
    service = Common::ShowRoleService.new(request_params, auth_header)
    service.run!
    render json: service.result, serializer: Common::RoleSerializer, status: :ok
  end

  def create
    request_params = Common::RoleRequestParams.new(params)
    request_params.validate!
    service = Common::UpsertRoleService.new(request_params, auth_header)
    service.run!
    render json: service.result, serializer: Common::RoleSerializer, status: :ok
  end
end
