# frozen_string_literal: true

module Contacts
  class ContactsSerializer < ActiveModel::Serializer
    attributes :contacts

    delegate to: :object

    def contacts
      object.contacts.each_with_object([]) do |contact, arr|
        arr << Contacts::ContactSerializer.new(contact)
      end
    end
  end
end
