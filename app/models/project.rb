class Project < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :theme, optional: true
  belongs_to :country, optional: true
  has_many :project_donation_options
  has_many :user_starred_projects
  has_many :users, through: :user_starred_projects

  def self.queryActiveProjects(params)
    if params[:nextProject]
      url = "https://api.globalgiving.org/api/public/projectservice/all/projects/active?api_key=4be97db5-e712-49b1-bae9-12c85422ce7a&nextProjectId=#{params[:nextProject]}"
    else
      url = "https://api.globalgiving.org/api/public/projectservice/all/projects/active?api_key=4be97db5-e712-49b1-bae9-12c85422ce7a"
    end
    json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
  end

end
