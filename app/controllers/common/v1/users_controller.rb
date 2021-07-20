# frozen_string_literal: true

class Common::V1::UsersController < ApplicationApiController
  def index
    service = Common::GetUsersService.new(nil)
    service.run!
    render json: service.results, serializer: Common::UsersSerializer, status: :ok
  end

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

  def user_name
    request_params = Common::GetByUserNameRequestParams.new(params)
    request_params.validate!
    service = Common::GetByUserNameService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Common::UserSerializer, status: :ok
  end

  def user_id
    request_params = Common::GetByUserIdRequestParams.new(params)
    request_params.validate!
    service = Common::GetByUserIdService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Common::UserSerializer, status: 200
  end
end
