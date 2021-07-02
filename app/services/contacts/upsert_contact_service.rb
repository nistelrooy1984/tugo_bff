# frozen_string_literal: true

module Contacts
  class UpsertContactService < Contacts::ServiceBase
    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      upsert_contact_request_params = Tugo::Contacts::V1::UpsertContactRequest.new(
        contact: Tugo::Contacts::V1::Contact.new(
          id: proto_int64(@request_params.id),
          first_name: proto_string(@request_params.first_name),
          last_name: proto_string(@request_params.last_name),
          email: proto_string(@request_params.email),
          phone: proto_string(@request_params.phone),
          title: proto_string(@request_params.title),
          creator_id: proto_int64(@request_params.creator_id),
          owner_id: proto_int64(@request_params.owner_id),
          modified_by_id: proto_int64(@request_params.modified_by_id),
          master_leadsource_id: proto_int64(@request_params.master_leadsource_id),
          is_converted_from_lead: proto_bool(@request_params.is_converted_from_lead),
          is_do_not_call: proto_bool(@request_params.is_do_not_call),
          source: proto_string(@request_params.source),
          description: proto_string(@request_params.description)
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
        id: contact.id&.value,
        first_name: contact.first_name&.value,
        last_name: contact.last_name&.value,
        email: contact.email&.value,
        phone: contact.phone&.value,
        title: contact.title&.value,
        creator_id: contact.creator_id&.value,
        owner_id: contact.owner_id&.value,
        modified_by_id: contact.modified_by_id&.value,
        master_leadsource_id: contact.master_leadsource_id&.value,
        is_converted_from_lead: contact.is_converted_from_lead&.value,
        is_do_not_call: contact.is_do_not_call&.value,
        source: contact.source&.value,
        description: contact.description&.value,
        created_at: contact.created_at&.value,
        updated_at: contact.updated_at&.value
      )
    end
  end
end
