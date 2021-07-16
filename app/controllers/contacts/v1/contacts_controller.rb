# frozen_string_literal: true

class Contacts::V1::ContactsController < ApplicationApiController
  def index
    render json: { contacts: Settings.contacts.host }, status: :ok
  end

  def show
    request_params = Contacts::ShowContactRequestParams.new(params)
    request_params.validate!
    service = Contacts::ShowContactService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Contacts::ContactSerializer, status: :ok
  end

  def create
    request_params = Contacts::UpsertContactRequestParams.new(params)
    request_params.validate!
    service = Contacts::UpsertContactService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Contacts::UpsertContactSerializer, status: :ok
  end

  def assigned_to
    request_params = Contacts::AssignedToRequestParams.new(params)
    request_params.validate!
    service = Contacts::AssignedToService.new(request_params, nil)
    service.run!
    render json: service.results, serializer: Contacts::ContactsSerializer, status: :ok
  end
end
