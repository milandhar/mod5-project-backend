# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  User.delete_all

  i = 0
  while i < 15
    username = Faker::Hipster.word
    password = Faker::Color.color_name
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email_address = Faker::Internet.email

    @user = User.new(username: username, password: password, first_name: first_name, last_name: last_name, email_address: email_address)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    @user.password_digest = BCrypt::Password.create(password, cost: cost)

    if @user.save
      @token = JWT.encode({user_id: @user.id}, 'my_s3cre3t')
    end
    
    i+=1
  end


    project0 = Project.all[0]
    project1 = Project.all[1]
    project2 = Project.all[2]
    project3 = Project.all[3]
    project4 = Project.all[4]
    project5 = Project.all[5]
    project6 = Project.all[6]
    project7 = Project.all[7]
    project8 = Project.all[8]
    project9 = Project.all[9]

    user0 = User.all[0]
    user1 = User.all[1]
    user2 = User.all[2]
    user3 = User.all[3]
    user4 = User.all[4]
    user5 = User.all[5]

    user0.projects << [project0, project2, project4, project6, project8]
    user1.projects << [project1, project3, project5, project7, project9]
    user2.projects << [project1, project3, project5]
    user3.projects << [project0, project2, project4, project6]
    user4.projects << [project1, project5, project7, project9]
