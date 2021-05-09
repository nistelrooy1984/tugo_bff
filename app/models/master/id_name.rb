# frozen_string_literal: true

module Master
  class IdName < ActiveModelSerializers::Model
    attributes :id, :name
  end
end
