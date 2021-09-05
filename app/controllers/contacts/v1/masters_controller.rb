# frozen_string_literal: true

class Contacts::V1::MastersController < ApplicationApiController
  include TugoCommon::RequestHandler::AuthRestHeaderHandler

  def index
    service = Contacts::GetMastersService.new(auth_header)
    service.run!
    render json: service.results, status: :ok
  end
end
