# frozen_string_literal: true

module Contacts
  class UpsertContactService < Contacts::ServiceBase
    attr_reader :result

    def initialize(request_params, auth_header)
      super(
        @request_params = request_params,
        @auth_header = auth_header
      )
    end

    def run!
      upsert_contact_request_params = Tugo::Contacts::V1::UpsertContactRequest.new(
        contact: Tugo::Contacts::V1::Contact.new(
          id: @request_params.id,
          first_name: @request_params.first_name,
          last_name: @request_params.last_name,
          email: @request_params.email,
          phone: @request_params.phone,
          title: @request_params.title,
          creator_id: @request_params.creator_id,
          owner_id: @request_params.owner_id,
          modified_by_id: @request_params.modified_by_id,
          master_leadsource_id: @request_params.master_leadsource_id,
          is_converted_from_lead: @request_params.is_converted_from_lead,
          is_do_not_call: @request_params.is_do_not_call,
          source: @request_params.source,
          description: @request_params.description
        )
      )

      response = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.contacts.host,
        Tugo::Contacts::V1::ContactService,
        :UpsertContact,
        upsert_contact_request_params.to_h
      ).message

      set_result(response.contact)
    end

    def set_result(contact)
      @result = Contacts::ContactModel.new(
        id: contact.id,
        first_name: contact.first_name,
        last_name: contact.last_name,
        email: contact.email,
        phone: contact.phone,
        title: contact.title,
        creator_id: contact.creator_id,
        owner_id: contact.owner_id,
        modified_by_id: contact.modified_by_id,
        master_leadsource_id: contact.master_leadsource_id,
        is_converted_from_lead: contact.is_converted_from_lead,
        is_do_not_call: contact.is_do_not_call,
        source: contact.source,
        description: contact.description,
        created_at: contact.created_at,
        updated_at: contact.updated_at
      )
    end
  end
end
