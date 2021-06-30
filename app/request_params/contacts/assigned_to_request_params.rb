# frozen_string_literal: true

module Contacts
  class AssignedToRequestParams < TugoCommon::RequestParamsBase
    attribute :owner_id, :integer

    validates :owner_id, numericality: {only_integer: true, greater_than: 0}

    def initialize(params)
      super(
        owner_id: params[:owner_id]
      )
    end
  end
end