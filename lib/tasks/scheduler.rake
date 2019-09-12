task :fetch_projects => :environment do
  # app = ActionDispatch::Integration::Session.new(Rails.application)
  # byebug
  # app.post "/fetch_projects"
  puts "Deleting Tables..."
  Project.delete_all
  ProjectDonationOption.delete_all
  UserStarredProject.delete_all
  puts "done."
  byebug
  puts "Fetching Projects..."
  Project.fetch(nextProject: false)
  puts "done."
end
