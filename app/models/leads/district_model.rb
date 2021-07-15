# frozen_string_literal: true

module Leads
  class DistrictModel < ActiveModelSerializers::Model
    attributes  :id, 
                :name,
                :master_province_id,
                :order,
                :is_usable,
                :created_at,
                :updated_at
  end
end