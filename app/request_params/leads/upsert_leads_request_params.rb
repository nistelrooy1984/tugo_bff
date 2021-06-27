# frozen_string_literal: true

module Leads
  class UpsertLeadsRequestParams < TugoCommon::RequestParamsBase
    attribute :leads

    validates :leads, presence: true

    def initialize(params)
      leads = get_leads(params[:leads])

      super(
        leads: leads
      )
    end

    private

    def get_leads(leads)
      leads.each_with_object([]) do |lead, arr|
        arr << Leads::LeadRequestParams.new(lead)
      end
    end
  end
end
