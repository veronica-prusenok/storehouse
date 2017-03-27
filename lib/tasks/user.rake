namespace :user do
  desc 'creates the admin user'
  task :create, [:login, :password] => :environment do |t, args|
    args.with_defaults(login: '123@12.com', password: 'qwerty')

    User.create!(
      email: args[:login],
      password: args[:password]
    )
  end
end
