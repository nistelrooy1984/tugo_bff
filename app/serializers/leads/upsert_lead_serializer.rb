# frozen_string_literal: true

module Leads
  class UpsertLeadSerializer < ApplicationSerializer
    attribute :id
    attribute :first_name
    attribute :last_name
    attribute :phone
    attribute :email
    attribute :master_status_id
    attribute :master_lead_source_id
    attribute :master_industry_id
    attribute :master_rating_id
    attribute :address
    attribute :master_ward_id
    attribute :master_district_id
    attribute :master_province_id
    attribute :master_country_id
    attribute :description
    attribute :creator_id
    attribute :owner_id
    attribute :modified_by_id
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

    def phone
      object.phone
    end

    def email
      object.email
    end

    def master_status_id
      object.master_status_id
    end

    def master_lead_source_id
      object.master_lead_source_id
    end

    def master_industry_id
      object.master_industry_id
    end

    def master_rating_id
      object.master_rating_id
    end

    def address
      object.address
    end

    def master_ward_id
      object.master_ward_id
    end

    def master_district_id
      object.master_district_id
    end

    def master_province_id
      object.master_province_id
    end

    def master_country_id
      object.master_country_id
    end

    def description
      object.description
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

    def created_at
      Time.zone.parse(object.created_at).rfc3339
    end

    def updated_at
      Time.zone.parse(object.updated_at).rfc3339
    end
  end
end
