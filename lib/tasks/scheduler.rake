desc "This task is called by the Heroku scheduler add-on"
task :delete_tables => :environment do
  puts "Deleting Tables..."
  app = ActionDispatch::Integration::Session.new(Rails.application)
  app.get "/delete_all"
  puts "done."
end

task :fetch_projects => :environment do
  puts "Fetching Projects..."
  # app = ActionDispatch::Integration::Session.new(Rails.application)
  # byebug
  # app.post "/fetch_projects"
  Project.fetch(nextProject: false)
  puts "done."
end
