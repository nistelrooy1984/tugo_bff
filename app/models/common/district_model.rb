# frozen_string_literal: true

module Common
  class DistrictModel < ActiveModelSerializers::Model
    attributes :id,
               :name,
               :code,
               :code_name,
               :division_type,
               :short_code_name,
               :order,
               :is_usable,
               :master_province_id
  end
end
