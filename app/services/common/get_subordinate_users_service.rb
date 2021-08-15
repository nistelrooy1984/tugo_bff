# frozen_string_literal: true

module Common
  class GetSubordinateUsersService < Common::ServiceBase
    attr_reader :results

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      request_message = Tugo::Common::V1::UserIdRequest.new(
        user_id: proto_int64(@request_params.id)
      )

      response = TugoCommon::GrpcService.call_grpc(
        @auth_header,
        Settings.common.host,
        Tugo::Common::V1::UserService,
        :GetRoleBasedSubordinateUsers,
        request_message.to_h
      ).message

      set_results(response.users)
    end

    def set_results(users)
      @results = Common::UsersModel.new(
        users: users.each_with_object([]) do |user, arr|
          arr << Common::UserModel.new(
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
      )
    end
  end
end