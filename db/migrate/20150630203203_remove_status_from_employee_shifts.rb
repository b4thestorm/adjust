class RemoveStatusFromEmployeeShifts < ActiveRecord::Migration
  def change
    remove_column :employee_shifts, :status
  end
end
