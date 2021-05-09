# frozen_string_literal: true

class Leads::V1::LeadsController < ApplicationApiController
  def index
    render json: { 'contacts': Settings.leads.host }, status: 200
  end

  def create
    request_params = Leads::UpsertLeadRequestParams.new(params)
    request_params.validate!
    service = Leads::UpsertLeadService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Leads::UpsertLeadSerializer, status: 200
  end
end
