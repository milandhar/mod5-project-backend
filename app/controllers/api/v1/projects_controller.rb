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
      if(project["organization"])
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
      end
    end

  end

end
