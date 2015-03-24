class RemoveMonthFromShifts < ActiveRecord::Migration
  def change
  	remove_column :shifts, :month
  end
end
