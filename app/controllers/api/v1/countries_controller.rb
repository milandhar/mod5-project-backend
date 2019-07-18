class Api::V1::CountriesController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]

  def index
    @countries = Country.all
    render json: @countries
  end

  def create
    json = Country.queryAllCountries
    NormalizeCountry.to = :alpha3

    json["regions"]["region"].each do |region|
      region["countries"]["country"].each do |country|
        Country.find_or_create_by(iso3166CountryCode: NormalizeCountry.convert(country["iso3166CountryCode"]))
      end
    end
  end
  render json: Country.all
end
