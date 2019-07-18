class Api::V1::ProjectsController < ApplicationController
  # skip_before_action :authorized, only: [:index, :create]

  def index
    @projects = Project.all
    render json: @projects
  end

  def fetch
    @projects = []
    json = Project.queryActiveProjects
    byebug
    json.first[1]["project"].each do |project|
      @organization_countries = []
      @organization_themes = []
      if(project["organization"] &&
              project(["organization"]["themes"]) &&
              project(["organization"]["countries"]) &&)

        @project = Project.find_or_create_by(
          funding: project["funding"],
          goal: project["goal"],
          image_url: project["imageLink"],
          latitude: project["latitude"],
          longitiude: project["longitiude"],
          long_term_impact: project["longTermImpact"],
          need: project["need"],
          gg_organization_id: project["organization"]["id"],
          status: project["status"],
          summary: project["summary"],
          theme: project["themeName"],
          title: project["title"]
        )

        #create organization here
        @organization = Organization.find_or_create_by(
          Gg_organization_id: project["organization"]["id"],
          
        )

        @project["organization"]["themes"].each do |theme|
          @theme = Theme.find_or_create_by(theme_str_id: theme.id, name: theme.name)
          @organization_themes << @theme
        end

        @project["organization"]["countries"].each do |country|
          @country = Country.find_by(iso3166CountryCode: country.iso3166CountryCode)
          @organization_countries << @country
        end

      end
    end
  end
end
