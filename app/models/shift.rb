class Shift < ActiveRecord::Base
	belongs_to :employee
	has_many :notifies, as: :notifyable
  require 'date'
  # default_scope { where(account_id: Account.current_id )}

def self.weeks(wkn)
  today = Date.today
  if wkn.to_i == 1
   week_1 = (today..today.end_of_week).to_a
   # all_days = (week_1.at_beginning_of_week..week_1.at_end_of_week).map
   return week_1
  elsif wkn.to_i == 2
   week_2  = today.next_week.tomorrow
   all_days = (week_2.at_beginning_of_week..week_2.at_end_of_week).map
   return all_days.to_a
  elsif wkn.to_i == 3
   week_3 = today.next_week.next_week.tomorrow
   all_days = (week_3.at_beginning_of_week..week_3.at_end_of_week).map
   return all_days.to_a
  elsif wkn.to_i == 4
    week_4 = today.next_week.next_week.next_week.tomorrow
    all_days = (week_4.at_beginning_of_week..week_4.at_end_of_week).map
   return all_days.to_a
  end 
end

  def self.weeks_ranges
   today = Date.today
   current_week = "#{today} - #{today.end_of_week}"
    count = 0
    i = 7
    until count == 3
      "#{today.next_week + count*i} - #{today.end_of_week + count*i}"
      count += 1
    end
  end

# def self.get_days(wkn, desired_days)
#   week = Shift.weeks(wkn)
#   get_days = week.select do |x|
#     desired_days.any? { |day| x.send(day + '?') }
#   end 
# end

def self.get_days_week(wkn, desired_days)
  week_days = self.weeks(wkn)
  selected_days = week_days.select!{|x| desired_days.include? x.strftime('%A')}
  favorite_days = selected_days.map!{|x|x.strftime('%Y/%m/%d')}
  db_shifts =self.where(:shift_day => favorite_days)
end



end
