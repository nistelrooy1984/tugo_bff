# frozen_string_literal: true

module Contacts
  class UpsertContactRequestParams < TugoCommon::RequestParamsBase
    attribute :id, :integer
    attribute :salutation, :string
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :title, :string
    attribute :creator_id, :integer
    attribute :owner_id, :integer
    attribute :modified_by_id, :integer
    attribute :master_lead_source_id, :integer
    attribute :is_converted_from_lead, :boolean
    attribute :is_do_not_call, :boolean
    attribute :birthday, :string
    attribute :master_country_id, :integer
    attribute :master_province_id, :integer
    attribute :master_district_id, :integer
    attribute :master_ward_id, :integer
    attribute :street, :string
    attribute :description, :string
    attribute :delete_flag, :integer

    validates :last_name, presence: true
    validates :creator_id, numericality: { only_integer: true, greater_than: 0 }
    validates :owner_id, numericality: { only_integer: true, greater_than: 0 }
    validates :modified_by_id, numericality: { only_integer: true, greater_than: 0 }

    def initialize(params)
      super(
        id: params[:id],
        salutation: params[:salutation],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        phone: params[:phone],
        title: params[:title],
        creator_id: params[:creator_id],
        owner_id: params[:owner_id],
        modified_by_id: params[:modified_by_id],
        master_lead_source_id: params[:master_lead_source_id],
        is_converted_from_lead: params[:is_converted_from_lead],
        is_do_not_call: params[:is_do_not_call],
        birthday: params[:birthday],
        master_country_id: params[:master_country_id],
        master_province_id: params[:master_province_id],
        master_district_id: params[:master_district_id],
        master_ward_id: params[:master_ward_id],
        street: params[:street],
        description: params[:description],
        delete_flag: params[:delete_flag]
      )
    end
  end
end
