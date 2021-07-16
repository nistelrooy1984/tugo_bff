# frozen_string_literal: true

module Common
  class UpsertRoleRequestParams < TugoCommon::RequestParamsBase
    include ::NestedValidatable

    VALIDATE_ATTRIBUTES = %i[
      role
    ].freeze

    attribute :role

    validates :role, presence: true

    def initialize(params)
      super(
        role: Common::RoleRequestParams.new(params[:role])
      )
    end
  end
end
