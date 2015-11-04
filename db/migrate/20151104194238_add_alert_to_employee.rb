class AddAlertToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :alert, :string
  end
end
