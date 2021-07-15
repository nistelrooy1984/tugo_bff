# frozen_string_literal: true

module Leads
  class ProvinceModel < ActiveModelSerializers::Model
    attributes  :id, 
                :name,
                :master_country_id,
                :order,
                :is_usable,
                :created_at,
                :updated_at
  end
end