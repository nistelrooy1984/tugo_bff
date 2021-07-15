module Leads
  class ProvinceSerializer < ActiveModel::Serializer
    attributes  :id,
                :name,
                :master_country_id,
                :order,
                :is_usable,
                :created_at,
                :updated_at
    
    delegate  :id,
              :name,
              :master_country_id,
              :order,
              :is_usable,
              :created_at,
              :updated_at, to: :object
  end
end