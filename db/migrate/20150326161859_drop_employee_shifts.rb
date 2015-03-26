class DropEmployeeShifts < ActiveRecord::Migration
  def change
  	drop_table :employee_shifts
  end
end
