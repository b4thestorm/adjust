class ShiftMailer < ActionMailer::Base
  default from: "arnoldsander@gmail.com"
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

  def shift_accept(shift, )
    mail(to: @employee, subject: 'Your request was accepted')
  end

  def shift_reject
    mail(to: @employee, subject: 'Your request was rejected')
  end

end
