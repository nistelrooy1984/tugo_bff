# frozen_string_literal: true

class Common::V1::MasterController < ApplicationApiController
  include TugoCommon::RequestHandler::AuthRestHeaderHandler

  def wards
    request_params = Common::GetWardsByDistrictIdRequestParams.new(params)
    request_params.validate!
    service = Common::GetWardsByDistrictIdService.new(request_params, auth_header)
    service.run!
    render json: service.results, each_serializer: Common::WardsSerializer, status: :ok
  end

  def countries_provinces_districts
    service = Common::GetCountriesProvincesDistrictsService.new(auth_header)
    service.run!
    render json: service.results, each_serializer: Common::GetCountriesProvincesDistrictsSerializer, status: :ok
  end
end
