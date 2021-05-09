# frozen_string_literal: true

class Contacts::V1::ContactsController < ApplicationApiController
  def index
    render json: { 'contacts': Settings.contacts.host }, status: 200
  end

  def create
    request_params = Contacts::UpsertContactRequestParams.new(params)
    request_params.validate!
    service = Contacts::UpsertContactService.new(request_params, nil)
    service.run!
    render json: service.result, serializer: Contacts::UpsertContactSerializer, status: 200
  end
end
