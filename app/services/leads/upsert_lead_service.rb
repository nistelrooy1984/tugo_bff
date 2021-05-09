# frozen_string_literal: true

module Leads
  class UpsertLeadService < Leads::ServiceBase
    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      upsert_lead_request_params = Tugo::Leads::V1::UpsertLeadRequest.new(
        lead: Tugo::Leads::V1::Lead.new(
          id: Google::Protobuf::Int64Value.new(value: @request_params.id),
          first_name: Google::Protobuf::StringValue.new(value: @request_params.first_name),
          last_name: Google::Protobuf::StringValue.new(value: @request_params.last_name),
          phone: Google::Protobuf::StringValue.new(value: @request_params.phone),
          email: Google::Protobuf::StringValue.new(value: @request_params.email),
          master_status_id: Google::Protobuf::Int64Value.new(value: @request_params.master_status_id),
          master_lead_source_id: Google::Protobuf::Int64Value.new(value: @request_params.master_lead_source_id),
          master_industry_id: Google::Protobuf::Int64Value.new(value: @request_params.master_industry_id),
          master_rating_id: Google::Protobuf::Int64Value.new(value: @request_params.master_rating_id),
          address: Google::Protobuf::StringValue.new(value: @request_params.address),
          master_ward_id: Google::Protobuf::Int64Value.new(value: @request_params.master_ward_id),
          master_district_id: Google::Protobuf::Int64Value.new(value: @request_params.master_district_id),
          master_province_id: Google::Protobuf::Int64Value.new(value: @request_params.master_province_id),
          master_country_id: Google::Protobuf::Int64Value.new(value: @request_params.master_country_id),
          description: Google::Protobuf::StringValue.new(value: @request_params.description),
          creator_id: Google::Protobuf::Int64Value.new(value: @request_params.creator_id),
          owner_id: Google::Protobuf::Int64Value.new(value: @request_params.owner_id),
          modified_by_id: Google::Protobuf::Int64Value.new(value: @request_params.modified_by_id)
        )
      )

      response = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.leads.host,
        Tugo::Leads::V1::LeadService,
        :UpsertLead,
        upsert_lead_request_params.to_h
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
