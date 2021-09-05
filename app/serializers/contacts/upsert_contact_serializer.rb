# frozen_string_literal: true

module Contacts
  class UpsertContactSerializer < ApplicationSerializer
    attribute :id
    attribute :salutation
    attribute :first_name
    attribute :last_name
    attribute :email
    attribute :phone
    attribute :title
    attribute :creator_id
    attribute :owner_id
    attribute :modified_by_id
    attribute :master_lead_source_id
    attribute :is_converted_from_lead
    attribute :is_do_not_call
    attribute :birthday
    attribute :master_country_id
    attribute :master_province_id
    attribute :master_district_id
    attribute :master_ward_id
    attribute :street
    attribute :description
    attribute :delete_flag
    attribute :created_at
    attribute :updated_at

    delegate :id, to: :object

    delegate :salutation, to: :object

    delegate :first_name, to: :object

    delegate :last_name, to: :object

    delegate :email, to: :object

    delegate :phone, to: :object

    delegate :title, to: :object

    delegate :creator_id, to: :object

    delegate :owner_id, to: :object

    delegate :modified_by_id, to: :object

    delegate :master_lead_source_id, to: :object

    delegate :is_converted_from_lead, to: :object

    delegate :is_do_not_call, to: :object

    delegate :birthday, to: :object

    delegate :master_country_id, to: :object

    delegate :master_province_id, to: :object

    delegate :master_district_id, to: :object

    delegate :master_ward_id, to: :object

    delegate :street, to: :object

    delegate :description, to: :object

    delegate :delete_flag, to: :object

    def created_at
      Time.zone.parse(object.created_at).rfc3339
    end

    def updated_at
      Time.zone.parse(object.updated_at).rfc3339
    end
  end
end
