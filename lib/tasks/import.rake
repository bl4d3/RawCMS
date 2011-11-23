namespace :rawcms do
  task :create_admin => :environment do
  		Admin.create(:email => "demo@example.com", :password => "example.com", :password_confirmation => "example.com", :role => "admin")
  end
end