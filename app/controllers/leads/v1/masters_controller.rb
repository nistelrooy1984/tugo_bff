# frozen_string_literal: true

class Leads::V1::MastersController < ApplicationApiController
  include TugoCommon::RequestHandler::AuthRestHeaderHandler

  def index
    service = Leads::GetMastersService.new(auth_header)
    service.run!
    render json: service.results, status: :ok
  end
end
