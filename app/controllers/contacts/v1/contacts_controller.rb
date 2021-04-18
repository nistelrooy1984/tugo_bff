# frozen_string_literal: true

class Contacts::V1::ContactsController < ApplicationController
  def index
    render json: {'contacts': Settings.contacts.host}, status: 200
  end
end
