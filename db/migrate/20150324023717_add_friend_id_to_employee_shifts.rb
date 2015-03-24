class AddFriendIdToEmployeeShifts < ActiveRecord::Migration
  def change
  	add_column :employee_shifts, :friend_id, :integer
  end
end
