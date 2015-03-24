class RemoveDayFromShifts < ActiveRecord::Migration
  def change
  	remove_column :shifts, :day 
  end
end
