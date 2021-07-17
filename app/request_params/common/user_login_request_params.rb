# frozen_string_literal: true

module Common
  class UserLoginRequestParams < TugoCommon::RequestParamsBase
    PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

    attribute :user_name, :string
    attribute :password, :string
    attribute :email, :string
    attribute :phone, :string

    validates :email, email: true, allow_blank: true
    validates :password, presence: true,
                         length: { within: 8..40 },
                         format: { with: PASSWORD_FORMAT }

    def initialize(params)
      super(
        user_name: params[:user_name],
        password: params[:password],
        email: params[:email],
        phone: params[:phone]
      )
    end
  end
end
