class CreateEmployeeShifts < ActiveRecord::Migration
  def change
    create_table :employee_shifts do |t|
      t.references :employee, index: true
      t.references :shift, index: true

      t.timestamps
    end
  end
end
