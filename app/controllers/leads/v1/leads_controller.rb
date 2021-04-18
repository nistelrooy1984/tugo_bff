# frozen_string_literal: true

class Leads::V1::LeadsController < ApplicationController
  def index
    result = TugoCommon::GrpcService.call_grpc(
      nil,
      Settings.leads.host,
      Tugo::Leads::V1::LeadService,
      :GetLeadList
    ).message

    render json: result, status: 200
  end
end
