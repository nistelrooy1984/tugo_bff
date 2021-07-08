# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tugo/common/v1/group.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file('tugo/common/v1/group.proto', syntax: :proto3) do
    add_message 'tugo.common.v1.GroupIdRequest' do
      optional :group_id, :message, 1, 'google.protobuf.Int64Value'
    end
    add_message 'tugo.common.v1.GroupResponse' do
      optional :group, :message, 1, 'tugo.common.v1.Group'
    end
    add_message 'tugo.common.v1.GroupsResponse' do
      repeated :groups, :message, 1, 'tugo.common.v1.Group'
    end
    add_message 'tugo.common.v1.UpsertGroupRequest' do
      optional :group, :message, 1, 'tugo.common.v1.Group'
    end
    add_message 'tugo.common.v1.UpsertGroupResponse' do
      optional :group, :message, 1, 'tugo.common.v1.Group'
    end
    add_message 'tugo.common.v1.Group' do
      optional :id, :message, 1, 'google.protobuf.Int64Value'
      optional :group_name, :message, 2, 'google.protobuf.StringValue'
      optional :group_email, :message, 3, 'google.protobuf.StringValue'
      optional :description, :message, 4, 'google.protobuf.StringValue'
      optional :group_members, :message, 5, 'google.protobuf.StringValue'
      optional :created_at, :message, 6, 'google.protobuf.StringValue'
      optional :updated_at, :message, 7, 'google.protobuf.StringValue'
    end
  end
end

module Tugo
  module Common
    module V1
      GroupIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('tugo.common.v1.GroupIdRequest').msgclass
      GroupResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('tugo.common.v1.GroupResponse').msgclass
      GroupsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('tugo.common.v1.GroupsResponse').msgclass
      UpsertGroupRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('tugo.common.v1.UpsertGroupRequest').msgclass
      UpsertGroupResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('tugo.common.v1.UpsertGroupResponse').msgclass
      Group = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('tugo.common.v1.Group').msgclass
    end
  end
end