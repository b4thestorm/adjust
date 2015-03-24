class AddShiftDayToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :shift_day, :datetime
  end
end
