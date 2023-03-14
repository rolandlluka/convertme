# frozen_string_literal: true

require_relative "convertme/version"
require "net/http"
require "json"

module Convertme
  class Error < StandardError; end
  # Your code goes here...

  # This converts supported currencies
  class CurrencyConverter
    SUPPORTED_CURRENCIES = %w[EUR USD CHF].freeze

    def initialize(from_currency, to_currency)
      validate_currencies(from_currency, to_currency)
      @from_currency = from_currency
      @to_currency = to_currency
    end

    def run(amount)
      exchange_rate = fetch_exchange_rate
      converted_amount = amount.to_f * exchange_rate.to_f

      converted_amount.round(2)
    end

    private

    def validate_currencies(from_currency, to_currency)
      return if SUPPORTED_CURRENCIES.include?(from_currency) && SUPPORTED_CURRENCIES.include?(to_currency)

      raise ArgumentError, "Unsupported currency"
    end

    def fetch_exchange_rate
      url = "https://api.exchangerate-api.com/v4/latest/#{@from_currency}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      rates = JSON.parse(response)["rates"]

      raise ArgumentError, "Conversion rate not available" unless rates[@to_currency]

      rates[@to_currency]
    end
  end
end
