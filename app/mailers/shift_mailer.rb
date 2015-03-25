class ShiftMailer < ActionMailer::Base
  default from: "from@example.com"
  extend ApplicationHelper
  include ApplicationHelper
  helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shift_mailer.shift_notify.subject
  #
  def shift_notify(@shift, @employee)
    @employee = @employee.full_name
    @shift = @shift.employee.full_name
    @time = @shift.shift_day

    mail(to: @shift.employee.email, subject:'Interested in your Shift')
  end
end
