# frozen_string_literal: true

module Contacts
  class ContactModel < ActiveModelSerializers::Model
    attributes :id,
               :salutation,
               :first_name,
               :last_name,
               :email,
               :phone,
               :title,
               :creator_id,
               :owner_id,
               :modified_by_id,
               :master_lead_source_id,
               :is_converted_from_lead,
               :is_do_not_call,
               :birthday,
               :master_country_id,
               :master_province_id,
               :master_district_id,
               :master_ward_id,
               :street,
               :description,
               :delete_flag,
               :created_at,
               :updated_at
  end
end
