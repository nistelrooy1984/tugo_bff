module Contacts
  class UpsertContactsService < Contacts::ServiceBase
    attr_reader :results

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header 
    end

    def run!
      upsert_contacts_request = Tugo::Contacts::V1::UpsertContactsRequest.new(
        contacts: @request_params.contacts.each_with_object([]) do |contact, arr|
          arr << Tugo::Contacts::V1::Contact.new(
            id: proto_int64(contact.id),
            first_name: proto_string(contact.first_name),
            last_name: proto_string(contact.last_name),
            email: proto_string(contact.email),
            phone: proto_string(contact.phone),
            title: proto_string(contact.title),
            creator_id: proto_int64(contact.creator_id),
            owner_id: proto_int64(contact.owner_id),
            modified_by_id: proto_int64(contact.modified_by_id),
            master_leadsource_id: proto_int64(contact.master_leadsource_id),
            is_converted_from_lead: proto_bool(contact.is_converted_from_lead),
            is_do_not_call: proto_bool(contact.is_do_not_call),
            source: proto_string(contact.source),
            description: proto_string(contact.description)
          )
        end
      )

      responses = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.contacts.host,
        Tugo::Contacts::V1::ContactService,
        :UpsertContacts,
        upsert_contacts_request.to_h
      ).message

      set_results(responses.contacts)
    end

    def set_results(contacts)
      @results = Contacts::ContactsModel.new(
        contacts: contacts.each_with_object([]) do |contact, arr|
          arr << Contacts::ContactModel.new(
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
      )
    end
  end
end