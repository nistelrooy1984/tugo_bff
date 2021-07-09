module Contacts
  class AssignedToService < Contacts::ServiceBase
    attr_reader :results

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      owner_id_request = Tugo::Contacts::V1::ContactOwnerIdRequest.new(
        owner_id: proto_int64(@request_params.owner_id)
      )

      responses = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.contacts.host,
        Tugo::Contacts::V1::ContactService,
        :GetContactsByOwnerId,
        owner_id_request.to_h
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