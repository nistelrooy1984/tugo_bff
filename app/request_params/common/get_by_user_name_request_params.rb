# frozen_string_literal: true

module Common
  class GetByUserNameRequestParams < TugoCommon::RequestParamsBase
    attribute :user_name, :string

    validates :user_name, presence: true

    def initialize(params)
      super(
        user_name: params[:user_name]
      )
    end
  end
end
