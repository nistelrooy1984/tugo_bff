# frozen_string_literal: true

module Leads
  class UpsertLeadsService < Leads::ServiceBase
    attr_reader :results

    def initialize(request_params, auth_header)
      super(
        @request_params = request_params,
        @auth_header = auth_header
      )
    end

    def run!
      upsert_leads_request = Tugo::Leads::V1::UpsertLeadsRequest.new(
        leads: @request_params.leads.each_with_object([]) do |lead, arr|
          arr << Tugo::Leads::V1::Lead.new(
            id: proto_int64(lead.id),
            first_name: proto_string(lead.first_name),
            last_name: proto_string(lead.last_name),
            phone: proto_string(lead.phone),
            email: proto_string(lead.email),
            master_status_id: proto_int64(lead.master_status_id),
            master_lead_source_id: proto_int64(lead.master_lead_source_id),
            master_industry_id: proto_int64(lead.master_industry_id),
            master_rating_id: proto_int64(lead.master_rating_id),
            address: proto_string(lead.address),
            master_ward_id: proto_int64(lead.master_ward_id),
            master_district_id: proto_int64(lead.master_district_id),
            master_province_id: proto_int64(lead.master_province_id),
            master_country_id: proto_int64(lead.master_country_id),
            description: proto_string(lead.description),
            creator_id: proto_int64(lead.creator_id),
            owner_id: proto_int64(lead.owner_id),
            modified_by_id: proto_int64(lead.modified_by_id)
          )
        end
      )

      responses = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.leads.host,
        Tugo::Leads::V1::LeadService,
        :UpsertLeads,
        upsert_leads_request.to_h
      ).message

      set_results(responses.leads)
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/PerceivedComplexity
    def set_results(leads)
      @results = Leads::LeadsModel.new(
        leads: leads.each_with_object([]) do |lead, arr|
          arr << Leads::LeadModel.new(
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
      )
    end
    # rubocop:enable Metrics/PerceivedComplexity
    # rubocop:enable Metrics/CyclomaticComplexity
  end
end
