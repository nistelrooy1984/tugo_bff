# frozen_string_literal: true

module Leads
  class WardModel < ActiveModelSerializers::Model
    attributes  :id, 
                :name,
                :master_district_id,
                :order,
                :is_usable,
                :created_at,
                :updated_at
  end
end