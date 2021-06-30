# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tugo/contacts/v1/contact.proto

require 'google/protobuf'

require 'google/protobuf/empty_pb'
require 'google/protobuf/wrappers_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tugo/contacts/v1/contact.proto", :syntax => :proto3) do
    add_message "tugo.contacts.v1.ContactIdRequest" do
      optional :contact_id, :message, 1, "google.protobuf.Int64Value"
    end
    add_message "tugo.contacts.v1.ContactResponse" do
      optional :contact, :message, 1, "tugo.contacts.v1.Contact"
    end
    add_message "tugo.contacts.v1.ContactOwnerIdRequest" do
      optional :owner_id, :message, 1, "google.protobuf.Int64Value"
    end
    add_message "tugo.contacts.v1.ContactsResponse" do
      repeated :contacts, :message, 1, "tugo.contacts.v1.Contact"
    end
    add_message "tugo.contacts.v1.UpsertContactRequest" do
      optional :contact, :message, 1, "tugo.contacts.v1.Contact"
    end
    add_message "tugo.contacts.v1.UpsertContactResponse" do
      optional :contact, :message, 1, "tugo.contacts.v1.Contact"
    end
    add_message "tugo.contacts.v1.UpsertContactsRequest" do
      repeated :contacts, :message, 1, "tugo.contacts.v1.Contact"
    end
    add_message "tugo.contacts.v1.UpsertContactsResponse" do
      repeated :contacts, :message, 1, "tugo.contacts.v1.Contact"
    end
    add_message "tugo.contacts.v1.Contact" do
      optional :id, :message, 1, "google.protobuf.Int64Value"
      optional :first_name, :message, 2, "google.protobuf.StringValue"
      optional :last_name, :message, 3, "google.protobuf.StringValue"
      optional :email, :message, 4, "google.protobuf.StringValue"
      optional :phone, :message, 5, "google.protobuf.StringValue"
      optional :title, :message, 6, "google.protobuf.StringValue"
      optional :creator_id, :message, 7, "google.protobuf.Int64Value"
      optional :owner_id, :message, 8, "google.protobuf.Int64Value"
      optional :modified_by_id, :message, 9, "google.protobuf.Int64Value"
      optional :master_leadsource_id, :message, 10, "google.protobuf.Int64Value"
      optional :is_converted_from_lead, :message, 11, "google.protobuf.BoolValue"
      optional :is_do_not_call, :message, 12, "google.protobuf.BoolValue"
      optional :source, :message, 13, "google.protobuf.StringValue"
      optional :description, :message, 14, "google.protobuf.StringValue"
      optional :created_at, :message, 15, "google.protobuf.StringValue"
      optional :updated_at, :message, 16, "google.protobuf.StringValue"
    end
  end
end

module Tugo
  module Contacts
    module V1
      ContactIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.ContactIdRequest").msgclass
      ContactResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.ContactResponse").msgclass
      ContactOwnerIdRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.ContactOwnerIdRequest").msgclass
      ContactsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.ContactsResponse").msgclass
      UpsertContactRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.UpsertContactRequest").msgclass
      UpsertContactResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.UpsertContactResponse").msgclass
      UpsertContactsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.UpsertContactsRequest").msgclass
      UpsertContactsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.UpsertContactsResponse").msgclass
      Contact = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tugo.contacts.v1.Contact").msgclass
    end
  end
end
