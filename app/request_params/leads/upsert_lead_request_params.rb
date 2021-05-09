# frozen_string_literal: true

module Leads
  class UpsertLeadRequestParams < TugoCommon::RequestParamsBase
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

    validates :last_name, presence: true
    validates :creator_id, numericality: { only_integer: true, greater_than: 0 }
    validates :owner_id, numericality: { only_integer: true, greater_than: 0 }
    validates :modified_by_id, numericality: { only_integer: true, greater_than: 0 }

    def initialize(params)
      super(
        id: params[:id],
        first_name: params[:first_name],
        last_name: params[:last_name],
        phone: params[:phone],
        email: params[:email],
        master_status_id: params[:master_status_id],
        master_lead_source_id: params[:master_lead_source_id],
        master_industry_id: params[:master_industry_id],
        master_rating_id: params[:master_rating_id],
        address: params[:address],
        master_ward_id: params[:master_ward_id],
        master_district_id: params[:master_district_id],
        master_province_id: params[:master_province_id],
        master_country_id: params[:master_country_id],
        description: params[:description],
        creator_id: params[:creator_id],
        owner_id: params[:owner_id],
        modified_by_id: params[:modified_by_id]
      )
    end
  end
end
