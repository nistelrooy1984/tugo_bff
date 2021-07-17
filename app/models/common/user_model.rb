# frozen_string_literal: true

module Common
  class UserModel < ActiveModelSerializers::Model
    attributes :id,
               :user_name,
               :encrypted_password,
               :first_name,
               :last_name,
               :email,
               :phone,
               :department_id,
               :role_id,
               :reports_to_id,
               :is_admin,
               :modified_by_id,
               :description,
               :deleted,
               :created_at,
               :updated_at
  end
end
