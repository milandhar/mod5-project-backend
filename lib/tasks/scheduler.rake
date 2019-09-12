desc "This task is called by the Heroku scheduler add-on"
task :delete_tables => :environment do
  puts "Deleting Tables..."
  app = ActionDispatch::Integration::Session.new(Rails.application)
  app.get "/delete_all"
  puts "done."
end


desc "This task is called by the Heroku scheduler add-on"
task :fetch_projects => :environment do
  puts "Fetching Projects..."
  app = ActionDispatch::Integration::Session.new(Rails.application)
  app.get "/fetch_projects"
  puts "done."
end
