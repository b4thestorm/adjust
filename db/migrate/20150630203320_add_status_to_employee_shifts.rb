class AddStatusToEmployeeShifts < ActiveRecord::Migration
  def change
    add_column :employee_shifts, :status, :string, :default => 'pending'
  end
end
