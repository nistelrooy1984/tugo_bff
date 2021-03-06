# frozen_string_literal: true

module Leads
  class ShowLeadService < Leads::ServiceBase
    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      lead_id_request = Tugo::Leads::V1::LeadIdRequest.new(
        lead_id: proto_int64(@request_params.id)
      )

      response = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.leads.host,
        Tugo::Leads::V1::LeadService,
        :GetLeadById,
        lead_id_request.to_h
      ).message

      set_result(response.lead)
    end

    def set_result(lead)
      @result = Leads::LeadModel.new(
        id: lead.id&.value,
        first_name: lead.first_name&.value,
        last_name: lead.last_name&.value,
        phone: lead.phone&.value,
        email: lead.email&.value,
        master_status_id: lead.master_status_id&.value,
        master_lead_source_id: lead.master_lead_source_id&.value,
        master_industry_id: lead.master_industry_id&.value,
        master_rating_id: lead.master_rating_id&.value,
        address: lead.address&.value,
        master_ward_id: lead.master_ward_id&.value,
        master_district_id: lead.master_district_id&.value,
        master_province_id: lead.master_province_id&.value,
        master_country_id: lead.master_country_id&.value,
        description: lead.description&.value,
        creator_id: lead.creator_id&.value,
        owner_id: lead.owner_id&.value,
        modified_by_id: lead.modified_by_id&.value,
        created_at: lead.created_at&.value,
        updated_at: lead.updated_at&.value
      )
    end
  end
end
