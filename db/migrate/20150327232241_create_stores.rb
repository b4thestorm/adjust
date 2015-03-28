class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :n_number
      t.references :employee, index: true

      t.timestamps
    end
  end
end
