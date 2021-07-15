# frozen_string_literal: true

module Leads
  class LeadsSerializer < ActiveModel::Serializer
    attributes :leads

    delegate to: :object
    
    def leads
      object.leads.each_with_object([]) do |lead, arr|
        arr << Leads::LeadSerializer.new(lead)
      end
    end
  end
end
