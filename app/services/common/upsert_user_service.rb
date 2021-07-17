# frozen_string_literal: true

module Common
  class UpsertUserService < Common::ServiceBase
    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      request_message = Tugo::Common::V1::UpsertUserRequest.new(
        user: Tugo::Common::V1::User.new(
          id: proto_int64(@request_params.id),
          user_name: proto_string(@request_params.user_name),
          encrypted_password: encrypted_password(@request_params.password),
          first_name: proto_string(@request_params.first_name),
          last_name: proto_string(@request_params.last_name),
          email: proto_string(@request_params.email),
          phone: proto_string(@request_params.phone),
          department_id: proto_int64(@request_params.department_id),
          role_id: proto_int64(@request_params.role_id),
          reports_to_id: proto_int64(@request_params.reports_to_id),
          is_admin: proto_bool(@request_params.is_admin),
          modified_by_id: proto_int64(@request_params.modified_by_id),
          description: proto_string(@request_params.description),
          deleted: proto_int64(@request_params.deleted),
          created_at: proto_string(@request_params.created_at),
          updated_at: proto_string(@request_params.updated_at)
        )
      )

      response = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.common.host,
        Tugo::Common::V1::UserService,
        :UpsertUser,
        request_message.to_h
      ).message

      set_result(response.user)
    end

    def set_result(user)
      @result = Common::UserModel.new(
        id: user.id&.value,
        user_name: user.user_name&.value,
        encrypted_password: user.encrypted_password&.value,
        first_name: user.first_name&.value,
        last_name: user.last_name&.value,
        email: user.email&.value,
        phone: user.phone&.value,
        department_id: user.department_id&.value,
        role_id: user.role_id&.value,
        reports_to_id: user.reports_to_id&.value,
        is_admin: user.is_admin&.value,
        modified_by_id: user.modified_by_id&.value,
        description: user.description&.value,
        deleted: user.deleted&.value,
        created_at: user.created_at&.value,
        updated_at: user.updated_at&.value
      )
    end

    def encrypted_password(password)
      password = "#{password}#{Settings.encrypted_password.pepper}" if Settings.encrypted_password.pepper.present?
      proto_string(::BCrypt::Password.create(password, cost: Settings.encrypted_password.stretches).to_s)
    end
  end
end
