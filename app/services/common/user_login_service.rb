# frozen_string_literal: true

module Common
  class UserLoginService < Common::ServiceBase
    attr_reader :result

    def initialize(request_params, auth_header)
      @request_params = request_params
      @auth_header = auth_header
    end

    def run!
      request_message = Tugo::Common::V1::LoginInfoRequest.new(
        user_name: proto_string(@request_params.user_name),
        encrypted_password: proto_string(@request_params.password),
        email: proto_string(@request_params.email),
        phone: proto_string(@request_params.phone)
      )

      response = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.common.host,
        Tugo::Common::V1::UserService,
        :UserLogin,
        request_message.to_h
      ).message

      raise TugoCommon::RequestParamsBase::InvalidRequestParams, OpenStruct.new(messages: { password: I18n.t('errors.messages.user.invalid_password') }) unless is_authentication?(response.user.encrypted_password&.value)

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

    def is_authentication?(encrypted_password)
      return false if encrypted_password.blank?

      bcrypt = BCrypt::Password.new(encrypted_password)

      password = @request_params.password
      password = "#{password}#{Settings.encrypted_password.pepper}" if Settings.encrypted_password.pepper.present?
      password = ::BCrypt::Engine.hash_secret(password, bcrypt.salt)

      return true if password == encrypted_password

      false
    end
  end
end
