# frozen_string_literal: true

class Contacts::V1::ContactsController < ApplicationApiController
  def index
    render json: { 'contacts': Settings.contacts.host }, status: 200
  end

  def show
    request_params = Contacts::ShowContactRequestParams.new(params)
    request_params.validate!
    service = Contacts::ShowContactService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Contacts::ContactSerializer, status: 200
  end

  def create
    request_params = Contacts::UpsertContactRequestParams.new(params)
    request_params.validate!
    service = Contacts::UpsertContactService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Contacts::UpsertContactSerializer, status: 200
  end

  def assigned_to
    request_params = Contacts::AssignedToRequestParams.new(params)
    request_params.validate!
    service = Contacts::AssignedToService.new(request_params, nil)
    service.run!
    render json: service.results, serializer: Contacts::ContactsSerializer, status: 200
  end
end
