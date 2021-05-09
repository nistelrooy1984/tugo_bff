# frozen_string_literal: true

module InsideErrorHandlerMapper
  HANDLER_MAP = {
    TugoCommon::RequestParamsBase::InvalidRequestParams => InsideError::InvalidRequestParamsErrorHandler
  }.freeze

  def self.get_handler(exception)
    HANDLER_MAP[exception.class]&.new(exception)
  end
end
