# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: tugo/common/v1/department.proto for package 'tugo.common.v1'

require 'grpc'
require 'tugo/common/v1/department_pb'

module Tugo
  module Common
    module V1
      module DepartmentService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'tugo.common.v1.DepartmentService'

          # --
          # cmn_00004 Get Department By Id
          # --
          rpc :GetDepartmentById, ::Tugo::Common::V1::DepartmentIdRequest, ::Tugo::Common::V1::DepartmentResponse
          # --
          # cmn_00005 Get Departments
          # --
          rpc :GetDepartments, ::Google::Protobuf::Empty, ::Tugo::Common::V1::DepartmentsResponse
          # --
          # cmn_00006 Upsert Department
          # --
          rpc :UpsertDepartment, ::Tugo::Common::V1::UpsertDepartmentRequest, ::Tugo::Common::V1::UpsertDepartmentResponse
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end