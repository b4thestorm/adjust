class RemoveEmployeeIdFromStores < ActiveRecord::Migration
  def change
  	remove_column :stores, :employee_id
  end
end
