namespace :user do
  desc 'creates the admin user'
  task :create, [:login, :password] => :environment do |_, args|
    args.with_defaults(login: '123@lvh.me', password: 'qwerty')

    User.create!(
      email: args[:login],
      password: args[:password],
      admin: true
    )
  end
end
