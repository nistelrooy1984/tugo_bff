# frozen_string_literal: true

module Common
  class UserRequestParams < TugoCommon::RequestParamsBase
    PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

    attribute :id, :integer
    attribute :user_name, :string
    attribute :password, :string
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :email, :string
    attribute :phone, :string
    attribute :department_id, :integer
    attribute :role_id, :integer
    attribute :reports_to_id, :integer
    attribute :is_admin, :boolean
    attribute :modified_by_id, :integer
    attribute :description, :string
    attribute :deleted, :integer
    attribute :created_at
    attribute :updated_at

    validates :id, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
    validates :user_name,
              :last_name, presence: true
    validates :role_id, :modified_by_id, numericality: { only_integer: true, greater_than: 0 }
    validates :is_admin, inclusion: { in: [true, false] }, allow_blank: true
    validates :email, email: true, allow_blank: true
    validates :password, presence: true,
                         length: { within: 8..40 },
                         format: { with: PASSWORD_FORMAT }

    def initialize(params)
      super(
        id: params[:id],
        user_name: params[:user_name],
        password: params[:password],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        phone: params[:phone],
        department_id: params[:department_id],
        role_id: params[:role_id],
        reports_to_id: params[:reports_to_id],
        is_admin: params[:is_admin],
        modified_by_id: params[:modified_by_id],
        description: params[:description],
        deleted: params[:deleted],
        created_at: params[:created_at],
        updated_at: params[:updated_at],
      )
    end
  end
end
