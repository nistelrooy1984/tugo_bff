# frozen_string_literal: true

module Contacts
  class GetContactsService < Contacts::ServiceBase
    attr_reader :results

    def initialize(auth_header)
      @auth_header = auth_header
    end

    def run!
      responses = TugoCommon::GrpcService.call_grpc(
        @auth_header,
        Settings.contacts.host,
        Tugo::Contacts::V1::ContactService,
        :GetContacts
      ).message

      set_results(responses.contacts)
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/PerceivedComplexity
    def set_results(contacts)
      @results = Contacts::ContactsModel.new(
        contacts: contacts.each_with_object([]) do |contact, arr|
          arr << Contacts::ContactModel.new(
            id: contact.id&.value,
            salutation: contact.salutation&.value,
            first_name: contact.first_name&.value,
            last_name: contact.last_name&.value,
            email: contact.email&.value,
            phone: contact.phone&.value,
            title: contact.title&.value,
            creator_id: contact.creator_id&.value,
            owner_id: contact.owner_id&.value,
            modified_by_id: contact.modified_by_id&.value,
            master_lead_source_id: contact.master_lead_source_id&.value,
            is_converted_from_lead: contact.is_converted_from_lead&.value,
            is_do_not_call: contact.is_do_not_call&.value,
            birthday: contact.birthday&.value,
            master_country_id: contact.master_country_id&.value,
            master_province_id: contact.master_province_id&.value,
            master_district_id: contact.master_district_id&.value,
            master_ward_id: contact.master_ward_id&.value,
            street: contact.street&.value,
            description: contact.description&.value,
            delete_flag: contact.delete_flag&.value,
            created_at: contact.created_at&.value,
            updated_at: contact.updated_at&.value
          )
        end
      )
    end
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/PerceivedComplexity
  end
end
