# frozen_string_literal: true

module Leads
  class LeadModel < ActiveModelSerializers::Model
    attributes :id,
               :first_name,
               :last_name,
               :phone,
               :email,
               :master_status_id,
               :master_lead_source_id,
               :master_industry_id,
               :master_rating_id,
               :master_ward_id,
               :master_district_id,
               :master_province_id,
               :master_country_id,
               :description,
               :creator_id,
               :owner_id,
               :modified_by_id,
               :salutation,
               :other_phone,
               :street,
               :delete_flag,
               :created_at,
               :updated_at
  end
end
