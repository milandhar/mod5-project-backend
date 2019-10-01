task :fetch_projects => :environment do
  # app = ActionDispatch::Integration::Session.new(Rails.application)
  # byebug
  # app.post "/fetch_projects"
  puts "Deleting Tables..."
  Project.delete_all
  ProjectDonationOption.delete_all
  UserStarredProject.delete_all
  puts "done."
  puts "Fetching Projects..."
  Project.fetch(nextProject: false)
  puts "done."
end

task :fetch_countries => :environment do
  puts "Deleting Countries..."
  Country.delete_all
  puts "Fetching Countries... "
  Country.queryAllCountries
  puts "done."
end
