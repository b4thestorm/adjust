class AddAuthcodeToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :authcode, :string
  end
end
