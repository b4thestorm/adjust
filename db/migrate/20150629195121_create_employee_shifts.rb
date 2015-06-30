class CreateEmployeeShifts < ActiveRecord::Migration
  def change
    create_table :employee_shifts do |t|
      t.integer :shift_id
      t.integer :employee_id
      t.integer :coworker_id
      t.string :status
      t.timestamps
    end
  end
end
