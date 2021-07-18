module Contacts
  class UpsertContactsRequestParams < TugoCommon::RequestParamsBase
    include ::NestedValidatable

    VALIDATE_ATTRIBUTES = %i[
      contacts
    ].freeze

    attribute :contacts

    validates :contacts, presence: true
    
    def initialize(params)
      contacts = get_contacts(params[:contacts])

      super(
        contacts: contacts
      )
    end

    private

    def get_contacts(contacts)
      contacts&.each_with_object([]) do |contact, arr|
        arr << Contacts::ContactRequestParams.new(contact)
      end
    end
  end
end