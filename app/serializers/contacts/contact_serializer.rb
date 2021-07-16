# frozen_string_literal: true

module Contacts
  class ContactSerializer < ActiveModel::Serializer
    attributes :id,
               :first_name,
               :last_name,
               :email,
               :phone,
               :title,
               :creator_id,
               :owner_id,
               :modified_by_id,
               :master_leadsource_id,
               :is_converted_from_lead,
               :is_do_not_call,
               :source,
               :description,
               :created_at,
               :updated_at
    delegate  :id,
              :first_name,
              :last_name,
              :email,
              :phone,
              :title,
              :creator_id,
              :owner_id,
              :modified_by_id,
              :master_leadsource_id,
              :is_converted_from_lead,
              :is_do_not_call,
              :source,
              :description,
              :created_at,
              :updated_at, to: :object
  end
end
