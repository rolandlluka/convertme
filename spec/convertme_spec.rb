# frozen_string_literal: true

require "rspec/mocks"

RSpec.describe Convertme do
  it "has a version number" do
    expect(Convertme::VERSION).not_to be nil
  end

  describe "#run" do
    before(:each) do
      @from_currency = "USD"
      @to_currency = "EUR"
      @amount = 100
      @exchange_rate = 1.22
      @exchange_rate_second = 1.44
      @exchange_rate_third = 1.55
    end

    context "when converting USD to EUR" do
      it "returns the correct conversion value" do
        # Create a mock response for fetch_exchange_rate
        allow_any_instance_of(Convertme::CurrencyConverter).to receive(:fetch_exchange_rate).and_return(@exchange_rate)
        converter = Convertme::CurrencyConverter.new(@from_currency, @to_currency)
        result = converter.run(@amount)
        expect(result).to eql(122.0)
      end
    end

    context "when converting  EUR to CHF" do
      it "returns the correct conversion value" do
        # Create a mock response for fetch_exchange_rate
        allow_any_instance_of(Convertme::CurrencyConverter).to receive(:fetch_exchange_rate).and_return(@exchange_rate_second)
        converter = Convertme::CurrencyConverter.new("EUR", "CHF")
        result = converter.run(@amount)
        expect(result).to eql(144.0)
      end
    end

    context "when converting CHF to USD" do
      it "returns the correct conversion value" do
        # Create a mock response for fetch_exchange_rate
        allow_any_instance_of(Convertme::CurrencyConverter).to receive(:fetch_exchange_rate).and_return(@exchange_rate_third)

        converter = Convertme::CurrencyConverter.new("CHF", "USD")
        result = converter.run(@amount)
        expect(result).to eql(155.0)
      end
    end

    context "when converting an unsupported currency" do
      it "raises an ArgumentError" do
        expect { Convertme::CurrencyConverter.new("GBP", "USD") }.to raise_error(ArgumentError, "Unsupported currency")
      end
    end
  end
end
