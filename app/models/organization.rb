class Organization < ApplicationRecord
  has_many :organization_themes
  has_many :themes, through: :projects
  has_many :countries, through: :projects
end
