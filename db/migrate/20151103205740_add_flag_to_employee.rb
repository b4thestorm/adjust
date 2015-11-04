class AddFlagToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :flag , :string
  end
end
