# frozen_string_literal: true

class Leads::V1::LeadsController < ApplicationApiController
  def index
    service = Leads::GetLeadsService.new(nil)
    service.run!
    render json: service.results, serializer: Leads::LeadsSerializer, status: 200
  end

  def show
    request_params = Leads::ShowLeadRequestParams.new(params)
    request_params.validate!
    service = Leads::ShowLeadService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Leads::LeadSerializer, status: 200
  end

  def assigned_to
    request_params = Leads::AssignedToRequestParams.new(params)
    request_params.validate!
    service = Leads::AssignedToService.new(request_params, nil)
    service.run!
    render json: service.results, serializer: Leads::LeadsSerializer, status: 200
  end

  def create
    request_params = Leads::UpsertLeadRequestParams.new(params)
    request_params.validate!
    service = Leads::UpsertLeadService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Leads::LeadSerializer, status: 200
  end
end
