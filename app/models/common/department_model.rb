# frozen_string_literal: true

module Common
  class DepartmentModel < ActiveModelSerializers::Model
    attributes :id,
               :department_name,
               :parent_department_id,
               :description,
               :created_at,
               :updated_at
  end
end
