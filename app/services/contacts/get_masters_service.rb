# frozen_string_literal: true

module Contacts
  class GetMastersService < Contacts::ServiceBase
    attr_reader :results

    def initialize(auth_header)
      @results = {}
      @auth_header = auth_header
    end

    def run!
      master_table_names = %w[
        lead_sources
      ]

      master_table_names.each do |table_name|
        responses = call_get_masters(table_name)

        id_name_arr = responses.common_master.each_with_object([]) do |common_master, arr|
          arr << to_id_name_hash(common_master)
        end

        @results["master_#{table_name}"] = id_name_arr.as_json
      end
    end

    private

    def call_get_masters(table_name)
      TugoCommon::GrpcService.call_grpc(
        @auth_header,
        Settings.contacts.host,
        Tugo::Contacts::V1::MasterService,
        :ListMaster,
        Tugo::Contacts::V1::ListMasterRequest.new(
          table_name: proto_string(table_name)
        ).to_h
      ).message
    end

    def to_id_name_hash(common_master)
      {
        id: common_master.id&.value,
        name: common_master.name&.value
      }
    end
  end
end
