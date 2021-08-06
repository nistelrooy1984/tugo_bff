# frozen_string_literal: true

module Common
  class DepartmentSerializer < ActiveModel::Serializer
    attributes :id,
               :department_name,
               :parent_department_id,
               :description,
               :created_at,
               :updated_at
    delegate :id,
             :department_name,
             :parent_department_id,
             :description,
             :created_at,
             :updated_at, to: :object
  end
end
