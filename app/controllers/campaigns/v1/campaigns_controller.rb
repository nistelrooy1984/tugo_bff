# frozen_string_literal: true

class Campaigns::V1::CampaignsController < ApplicationController
  def index
    render json: { 'campaigns': Settings.campaigns.host }, status: 200
  end
end
