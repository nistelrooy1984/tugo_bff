# frozen_string_literal: true

module Contacts
  class UpsertContactSerializer < ApplicationSerializer
    attribute :id
    attribute :first_name
    attribute :last_name
    attribute :email
    attribute :phone
    attribute :title
    attribute :creator_id
    attribute :owner_id
    attribute :modified_by_id
    attribute :master_leadsource_id
    attribute :is_converted_from_lead
    attribute :is_do_not_call
    attribute :source
    attribute :description
    attribute :created_at
    attribute :updated_at

    def id
      object.id
    end

    def first_name
      object.first_name
    end

    def last_name
      object.last_name
    end

    def email
      object.email
    end

    def phone
      object.phone
    end

    def title
      object.title
    end

    def creator_id
      object.creator_id
    end

    def owner_id
      object.owner_id
    end

    def modified_by_id
      object.modified_by_id
    end

    def master_leadsource_id
      object.master_leadsource_id
    end

    def is_converted_from_lead
      object.is_converted_from_lead
    end

    def is_do_not_call
      object.is_do_not_call
    end

    def source
      object.source
    end

    def description
      object.description
    end

    def created_at
      Time.zone.parse(object.created_at).rfc3339
    end

    def updated_at
      Time.zone.parse(object.updated_at).rfc3339
    end
  end
end
