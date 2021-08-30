# frozen_string_literal: true

class Leads::V1::LeadsController < ApplicationApiController
  include TugoCommon::RequestHandler::AuthRestHeaderHandler
  
  def index
    service = Leads::GetLeadsService.new(nil)
    service.run!
    render json: service.results, serializer: Leads::LeadsSerializer, status: :ok
  end

  def show
    request_params = Leads::ShowLeadRequestParams.new(params)
    request_params.validate!
    service = Leads::ShowLeadService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Leads::LeadSerializer, status: :ok
  end

  def assigned_to
    request_params = Leads::AssignedToRequestParams.new(params)
    request_params.validate!
    service = Leads::AssignedToService.new(request_params, nil)
    service.run!
    render json: service.results, serializer: Leads::LeadsSerializer, status: :ok
  end

  def create
    request_params = Leads::UpsertLeadRequestParams.new(params)
    request_params.validate!
    service = Leads::UpsertLeadService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Leads::LeadSerializer, status: :ok
  end

  def upsert
    request_params = Leads::UpsertLeadsRequestParams.new(params)
    request_params.validate!
    service = Leads::UpsertLeadsService.new(request_params, nil)
    service.run!
    render json: service.results, serializer: Leads::LeadsSerializer, status: :ok
  end

  def search
    request_params = Leads::SearchLeadsRequestParams.new(params)
    request_params.validate!
    service = Leads::SearchLeadsService.new(request_params, auth_header)
    service.run!
    render json: service.results, serializer: Leads::LeadsSerializer, status: :ok
  end
end
