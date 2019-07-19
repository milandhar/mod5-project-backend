class Api::V1::CountriesController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]

  def index
    @countries = Country.all
    render json: @countries
  end

  def create
    Country.destroy_all
    json = Country.queryAllCountries
    NormalizeCountry.to = :alpha3

    json["regions"]["region"].each do |region|
      region["countries"]["country"].each do |country|
        @country = Country.find_or_create_by(name: country["name"], iso3166CountryCode: NormalizeCountry.convert(country["iso3166CountryCode"]))
        @country.save
      end
    end
    render json: Country.all
  end
end
