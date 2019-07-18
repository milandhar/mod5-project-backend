class Theme < ApplicationRecord
  has_many :project_themes
  has_many :projects, through: :project_themes
  has_many :organization_themes
  has_many :organizations, through: :organization_themes
end
