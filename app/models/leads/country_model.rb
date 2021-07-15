# frozen_string_literal: true

module Leads
  class CountryModel < ActiveModelSerializers::Model
    attributes :id, 
               :name,
               :order,
               :is_usable,
               :created_at,
               :updated_at
  end
end