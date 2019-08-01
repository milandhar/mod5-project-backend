require 'dotenv/load'

class Project < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :theme, optional: true
  belongs_to :country, optional: true
  has_many :project_donation_options
  has_many :user_starred_projects
  has_many :users, through: :user_starred_projects

  def self.queryActiveProjects(params)
    api_key = ENV['API_KEY']
    if params[:nextProject]
      url = "https://api.globalgiving.org/api/public/projectservice/all/projects/active?api_key=#{api_key}&nextProjectId=#{params[:nextProject]}"
    else
      url = "https://api.globalgiving.org/api/public/projectservice/all/projects/active?api_key=#{api_key}"
    end
    json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
  end
end
