module Leads
 class WardSerializer < ActiveModel::Serializer
    attributes  :id,
                :name,
                :master_district_id,
                :order,
                :is_usable,
                :created_at,
                :updated_at
      
    delegate  :id,
              :name,
              :master_district_id,
              :order,
              :is_usable,
              :created_at,
              :updated_at, to: :object
 end
end