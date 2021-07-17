# frozen_string_literal: true

class Common::V1::UsersController < ApplicationApiController
  def create
    request_params = Common::UserRequestParams.new(params)
    request_params.validate!
    service = Common::UpsertUserService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Common::UserSerializer, status: :ok
  end

  def login
    request_params = Common::UserLoginRequestParams.new(params)
    request_params.validate!
    service = Common::UserLoginService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Common::UserSerializer, status: :ok
  end
end
