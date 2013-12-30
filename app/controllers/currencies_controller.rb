class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.all
  end
end
