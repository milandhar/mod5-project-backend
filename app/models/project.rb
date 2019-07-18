class Project < ApplicationRecord
  belongs_to :organization
  has_many :project_countries
  has_many :countries, through: :project_countries
  has_many :project_donation_options
  has_many :user_starred_projects
  has_many :users, through: :user_starred_projects
  has_many :project_themes
  has_many :themes, through: :project_themes
end
