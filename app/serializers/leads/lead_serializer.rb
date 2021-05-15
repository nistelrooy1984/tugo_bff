# frozen_string_literal: true

module Leads
  class LeadSerializer < ActiveModel::Serializer
    attributes :id,
               :first_name,
               :last_name,
               :phone,
               :email,
               :master_status_id,
               :master_lead_source_id,
               :master_industry_id,
               :master_rating_id,
               :address,
               :master_ward_id,
               :master_district_id,
               :master_province_id,
               :master_country_id,
               :description,
               :creator_id,
               :owner_id,
               :modified_by_id,
               :created_at,
               :updated_at
    delegate :id,
             :first_name,
             :last_name,
             :phone,
             :email,
             :master_status_id,
             :master_lead_source_id,
             :master_industry_id,
             :master_rating_id,
             :address,
             :master_ward_id,
             :master_district_id,
             :master_province_id,
             :master_country_id,
             :description,
             :creator_id,
             :owner_id,
             :modified_by_id,
             :created_at,
             :updated_at, to: :object

  end
end
