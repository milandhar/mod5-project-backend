class Organization < ApplicationRecord
  has_many :organization_themes
  has_many :themes, through: :organization_themes
  has_many :countries, through: :projects
end
