class Api::V1::ProjectsController < ApplicationController
  # skip_before_action :authorized, only: [:index, :create]

  def index
    @projects = Project.all
    render json: @projects
  end


  def fetch
    @projects = []
    json = Project.queryActiveProjects

    NormalizeCountry.to = :alpha3

    Project.delete_all
    Organization.delete_all

    json.first[1]["project"].each do |project|
      if(project["organization"] &&
              project["organization"]["themes"] &&
              project["organization"]["countries"])
        @project = Project.find_or_create_by(
          # country: project["country"],
          funding: project["funding"],
          goal: project["goal"],
          image_url: project["imageLink"],
          latitude: project["latitude"],
          longitude: project["longitude"],
          long_term_impact: project["longTermImpact"],
          need: project["need"],
          gg_organization_id: project["organization"]["id"],
          status: project["status"],
          summary: project["summary"],
          theme_str_id: project["themeName"],
          title: project["title"]
        )


        #need to add create methods to controllers?

        if (!Organization.find_by(Gg_organization_id: project["organization"]["id"]))
          #find or create organization here
          @organization = Organization.find_or_create_by(
            Gg_organization_id: project["organization"]["id"],
            city: project["organization"]["city"],
            country: project["organization"]["country"],
            mission: project["organization"]["mission"],
            name: project["organization"]["name"],
            url: project["organization"]["url"]
          )


          @theme = Theme.find_or_create_by(name: project["themeName"])
          # @organization.themes << @theme
          @project.theme = @theme

          # project["organization"]["themes"]["theme"].each do |theme|
          #   @theme = Theme.find_or_create_by(theme_str_id: theme["id"], name: theme["name"])
          #   #This is adding a blank row to the project table, thinking it's the join table
          #   #Just add the theme of this project!
          #   @organization.themes << @theme
          #   byebug
          # end

          @country = Country.find_by(name: project["country"])
          @project.country = @country

          # project["organization"]["countries"]["country"].each do |country|
          #   @country = Country.find_or_create_by(iso3166CountryCode: NormalizeCountry.convert(country["iso3166CountryCode"]))
          #   @organization.countries << @country
          # end
          # @organization.projects << @project
          @project.organization = @organization
          @organization.save
          @country.save
          @theme.save

        end
        @project.save
        @projects << @project

        if project["donationOptions"]
          project["donationOptions"]["donationOption"].each do |option|
            ProjectDonationOption.find_or_create_by(
              project_id: @project.id,
              amount: option["amount"],
              description: option["description"]
            )

          end
        end
      end
    end
  end
  render json: @projects
end
