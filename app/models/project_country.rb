class ProjectCountry < ApplicationRecord
  belongs_to :country
  belongs_to :project
end
