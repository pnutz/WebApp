class CurrenciesController < ApplicationController
	load_and_authorize_resource

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.all
  end
end