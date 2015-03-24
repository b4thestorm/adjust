class AddEmployeeToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :employee_id, :integer
  end
end
