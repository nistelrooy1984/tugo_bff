# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tugo/common/v1/master.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tugo/common/v1/master.proto", :syntax => :proto3) do
    add_message "tugo.common.v1.CountriesProvincesDistrictsResponse" do
      repeated :countries, :message, 1, "tugo.common.v1.Country"
      repeated :provinces, :message, 2, "tugo.common.v1.Province"
      repeated :districts, :message, 3, "tugo.common.v1.District"
    end
    add_message "tugo.common.v1.DistrictIdRequest" do
      optional :district_id, :message, 1, "google.protobuf.Int64Value"
    end
    add_message "tugo.common.v1.WardsResponse" do
      repeated :wards, :message, 1, "tugo.common.v1.Ward"
    end
    add_message "tugo.common.v1.Country" do
      optional :id, :message, 1, "google.protobuf.Int64Value"
      optional :name, :message, 2, "google.protobuf.StringValue"
      optional :code, :message, 3, "google.protobuf.StringValue"
      optional :code_name, :message, 4, "google.protobuf.StringValue"
      optional :phone_code, :message, 5, "google.protobuf.Int64Value"
      optional :order, :message, 6, "google.protobuf.Int32Value"
      optional :is_usable, :message, 7, "google.protobuf.BoolValue"
    end
    add_message "tugo.common.v1.Province" do
      optional :id, :message, 1, "google.protobuf.Int64Value"
      optional :name, :message, 2, "google.protobuf.StringValue"
      optional :code, :message, 3, "google.protobuf.StringValue"
      optional :code_name, :message, 4, "google.protobuf.StringValue"
      optional :division_type, :message, 5, "google.protobuf.StringValue"
      optional :phone_code, :message, 6, "google.protobuf.Int64Value"
      optional :order, :message, 7, "google.protobuf.Int32Value"
      optional :is_usable, :message, 8, "google.protobuf.BoolValue"
      optional :master_country_id, :message, 9, "google.protobuf.Int64Value"
    end
    add_message "tugo.common.v1.District" do
      optional :id, :message, 1, "google.protobuf.Int64Value"
      optional :name, :message, 2, "google.protobuf.StringValue"
      optional :code, :message, 3, "google.protobuf.StringValue"
      optional :code_name, :message, 4, "google.protobuf.StringValue"
      optional :division_type, :message, 5, "google.protobuf.StringValue"
      optional :short_code_name, :message, 6, "google.protobuf.StringValue"
      optional :order, :message, 7, "google.protobuf.Int32Value"
      optional :is_usable, :message, 8, "google.protobuf.BoolValue"
      optional :master_province_id, :message, 9, "google.protobuf.Int64Value"
    end
    add_message "tugo.common.v1.Ward" do
      optional :id, :message, 1, "google.protobuf.Int64Value"
      optional :name, :message, 2, "google.protobuf.StringValue"
      optional :code, :message, 3, "google.protobuf.StringValue"
      optional :code_name, :message, 4, "google.protobuf.StringValue"
      optional :division_type, :message, 5, "google.protobuf.StringValue"
      optional :short_code_name, :message, 6, "google.protobuf.StringValue"
      optional :order, :message, 7, "google.protobuf.Int32Value"
      optional :is_usable, :message, 8, "google.protobuf.BoolValue"
      optional :master_district_id, :message, 9, "google.protobuf.Int64Value"
    end
  end
end

module Tugo
  module Common
    module V1
      CountriesProvincesDistrictsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.CountriesProvincesDistrictsResponse").msgclass
      DistrictIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.DistrictIdRequest").msgclass
      WardsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.WardsResponse").msgclass
      Country = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.Country").msgclass
      Province = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.Province").msgclass
      District = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.District").msgclass
      Ward = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.Ward").msgclass
    end
  end
end
