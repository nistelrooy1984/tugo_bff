# frozen_string_literal: true

module Common
  class RoleModel < ActiveModelSerializers::Model
    attributes :id,
               :role_name,
               :parent_role,
               :depth,
               :description,
               :created_at,
               :updated_at
  end
end
