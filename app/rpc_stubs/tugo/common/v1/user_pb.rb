# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tugo/common/v1/user.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tugo/common/v1/user.proto", :syntax => :proto3) do
    add_message "tugo.common.v1.UserNameRequest" do
      optional :user_name, :message, 1, "google.protobuf.StringValue"
    end
    add_message "tugo.common.v1.UserResponse" do
      optional :user, :message, 1, "tugo.common.v1.User"
    end
    add_message "tugo.common.v1.UsersResponse" do
      repeated :users, :message, 1, "tugo.common.v1.User"
    end
    add_message "tugo.common.v1.UpsertUserRequest" do
      optional :user, :message, 1, "tugo.common.v1.User"
    end
    add_message "tugo.common.v1.UpsertUserResponse" do
      optional :user, :message, 1, "tugo.common.v1.User"
    end
    add_message "tugo.common.v1.LoginInfoRequest" do
      optional :user_name, :message, 1, "google.protobuf.StringValue"
      optional :email, :message, 2, "google.protobuf.StringValue"
      optional :phone, :message, 3, "google.protobuf.StringValue"
      optional :encrypted_password, :message, 4, "google.protobuf.StringValue"
    end
    add_message "tugo.common.v1.User" do
      optional :id, :message, 1, "google.protobuf.Int64Value"
      optional :user_name, :message, 2, "google.protobuf.StringValue"
      optional :encrypted_password, :message, 3, "google.protobuf.StringValue"
      optional :first_name, :message, 4, "google.protobuf.StringValue"
      optional :last_name, :message, 5, "google.protobuf.StringValue"
      optional :email, :message, 6, "google.protobuf.StringValue"
      optional :phone, :message, 7, "google.protobuf.StringValue"
      optional :department_id, :message, 8, "google.protobuf.Int64Value"
      optional :role_id, :message, 9, "google.protobuf.Int64Value"
      optional :reports_to_id, :message, 10, "google.protobuf.Int64Value"
      optional :is_admin, :message, 11, "google.protobuf.BoolValue"
      optional :modified_by_id, :message, 12, "google.protobuf.Int64Value"
      optional :description, :message, 13, "google.protobuf.StringValue"
      optional :created_at, :message, 14, "google.protobuf.StringValue"
      optional :updated_at, :message, 15, "google.protobuf.StringValue"
    end
  end
end

module Tugo
  module Common
    module V1
      UserNameRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.UserNameRequest").msgclass
      UserResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.UserResponse").msgclass
      UsersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.UsersResponse").msgclass
      UpsertUserRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.UpsertUserRequest").msgclass
      UpsertUserResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.UpsertUserResponse").msgclass
      LoginInfoRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.LoginInfoRequest").msgclass
      User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.common.v1.User").msgclass
    end
  end
end
