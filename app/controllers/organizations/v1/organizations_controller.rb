# frozen_string_literal: true

class Organizations::V1::OrganizationsController < ApplicationController
  def index
    render json: { organizations: Settings.organizations.host }, status: :ok
  end
end
