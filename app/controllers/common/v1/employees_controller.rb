# frozen_string_literal: true

class Common::V1::EmployeesController < ApplicationController
  def index
    render json: { 'employees': Settings.common.host }, status: 200
  end
end
