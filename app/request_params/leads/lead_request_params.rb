# frozen_string_literal: true

module Leads
  class LeadRequestParams < TugoCommon::RequestParamsBase
    attribute :id, :integer
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :phone, :string
    attribute :email, :string
    attribute :master_status_id, :integer
    attribute :master_lead_source_id, :integer
    attribute :master_industry_id, :integer
    attribute :master_rating_id, :integer
    attribute :address, :string
    attribute :master_ward_id, :integer
    attribute :master_district_id, :integer
    attribute :master_province_id, :integer
    attribute :master_country_id, :integer
    attribute :description, :string
    attribute :creator_id, :integer
    attribute :owner_id, :integer
    attribute :modified_by_id, :integer
    attribute :salutation, :string
    attribute :other_phone, :string
    attribute :street, :string
    attribute :delete_flag, :integer

    validates :last_name, presence: true
    validates :creator_id, numericality: { only_integer: true, greater_than: 0 }
    validates :owner_id, numericality: { only_integer: true, greater_than: 0 }
    validates :modified_by_id, numericality: { only_integer: true, greater_than: 0 }

    def initialize(lead)
      super(
        id: lead[:id],
        first_name: lead[:first_name],
        last_name: lead[:last_name],
        phone: lead[:phone],
        email: lead[:email],
        master_status_id: lead[:master_status_id],
        master_lead_source_id: lead[:master_lead_source_id],
        master_industry_id: lead[:master_industry_id],
        master_rating_id: lead[:master_rating_id],
        master_ward_id: lead[:master_ward_id],
        master_district_id: lead[:master_district_id],
        master_province_id: lead[:master_province_id],
        master_country_id: lead[:master_country_id],
        description: lead[:description],
        creator_id: lead[:creator_id],
        owner_id: lead[:owner_id],
        modified_by_id: lead[:modified_by_id],
        salutation: lead[:salutation],
        other_phone: lead[:other_phone],
        street: lead[:street],
        delete_flag: lead[:delete_flag]
      )
    end
  end
end
