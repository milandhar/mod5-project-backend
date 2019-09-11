desc "This task is called by the Heroku scheduler add-on"
task :delete_tables => :environment do
  puts "Deleting Tables..."
  app = ActionDispatch::Integration::Session.new(Rails.application)
  app.get "/package"
  puts "done."
end
