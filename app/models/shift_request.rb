class ShiftRequest < ActiveRecord::Base
require 'twilio-ruby'
after_create :remind


def initialize( user_id, shift_id)
@user_id = user_id
@shift_id = shift_id
end

def get_user
  Employee.where(id: @user_id).take
end 

def get_coworker
  Shift.where(id: @shift_id).take
end

def remind
  @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  @twilio_number = ENV['TWLNUM']
  @client.messages.create(
  from: @twilio_number,
  to: get_coworker.employee.phone,
  body: "#{get_user.full_name} is interested in taking your shift on #{get_coworker.shift_day}
          click here to approve the shift change."
  )
end



end
