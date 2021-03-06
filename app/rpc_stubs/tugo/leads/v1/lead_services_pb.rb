# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: tugo/leads/v1/lead.proto for package 'tugo.leads.v1'

require 'grpc'
require 'tugo/leads/v1/lead_pb'

module Tugo
  module Leads
    module V1
      module LeadService
        class Service
          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'tugo.leads.v1.LeadService'

          # --
          # led_00001 Get Lead By Id
          # --
          rpc :GetLeadById, ::Tugo::Leads::V1::LeadIdRequest, ::Tugo::Leads::V1::LeadResponse
          # --
          # led_00002 Get Leads By Owner Id (Assigned To)
          # --
          rpc :GetLeadsByOwnerId, ::Tugo::Leads::V1::LeadOwnerIdRequest, ::Tugo::Leads::V1::LeadsResponse
          # --
          # led_00003 Get Leads
          # --
          rpc :GetLeads, ::Google::Protobuf::Empty, ::Tugo::Leads::V1::LeadsResponse
          # --
          # led_00004 Upsert Lead
          # --
          rpc :UpsertLead, ::Tugo::Leads::V1::UpsertLeadRequest, ::Tugo::Leads::V1::UpsertLeadResponse
          # --
          # led_00005 Upsert Leads
          # --
          rpc :UpsertLeads, ::Tugo::Leads::V1::UpsertLeadsRequest, ::Tugo::Leads::V1::UpsertLeadsResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
