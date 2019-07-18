class Theme < ApplicationRecord
  has_many :projects,
  has_many :organization_themes
  has_many :organizations, through: :organization_themes
end
