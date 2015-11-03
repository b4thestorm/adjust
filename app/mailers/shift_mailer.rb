class ShiftMailer < ActionMailer::Base
  default from: "no-send@gmail.com"
  extend ApplicationHelper
  include ApplicationHelper
  helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shift_mailer.shift_notify.subject
  #
  def shift_notify(shift, employee)
    @shift_name = shift.employee.full_name
    @employee_name = employee.full_name
    @shift_time = shift.shift_day.strftime("%a-%d-%b")
    @employee = employee.id
    @email = shift.employee.email

    mail(to: @email, subject:'Interested in your Shift')
  end

  

end
