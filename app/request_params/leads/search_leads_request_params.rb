# frozen_string_literal: true

module Leads
  class SearchLeadsRequestParams < TugoCommon::RequestParamsBase
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :phone, :string
    attribute :email, :string
    attribute :owner_id, :integer

    validates :owner_id, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true

    def initialize(params)
      super(
        first_name: params[:first_name],
        last_name: params[:last_name],
        phone: params[:phone],
        email: params[:email],
        owner_id: params[:owner_id]
      )
    end
  end
end
