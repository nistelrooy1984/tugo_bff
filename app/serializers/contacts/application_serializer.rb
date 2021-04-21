# frozen_string_literal: true

module Contacts
  class ApplicationSerializer < ActiveModel::Serializer
    private
    def master_id_name(key)
      content = object.send(key) if object.respond_to?(key)
      Master::IdName.new(
        id: content&.id&.value,
        name: content&.name&.value
      )
    end
  end
end
