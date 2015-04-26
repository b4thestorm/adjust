# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :user_name => 'arnoldsanders',
  :password => 'necros12',
  :domain => 'shiftlist.co',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
