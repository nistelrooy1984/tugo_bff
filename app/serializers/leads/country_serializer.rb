module Leads
  class CountrySerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :order,
               :is_usable,
               :created_at,
               :updated_at
    
    delegate  :id,
              :name,
              :order,
              :is_usable,
              :created_at,
              :updated_at, to: :object
  end
end