# frozen_string_literal: true

class Common::V1::MasterController < ApplicationApiController
  def countries_provinces_districts
    service = Common::GetCountriesProvincesDistrictsService.new(nil)
    service.run!
    render json: service.results, each_serializer: Common::GetCountriesProvincesDistrictsSerializer, status: :ok
  end
end