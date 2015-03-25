class CreateNotifies < ActiveRecord::Migration
  def change
    create_table :notifies do |t|
    	t.boolean :notify
    	t.integer :employee_id
    	t.references :notifyable, polymorphic: true
    	t.timestamps 
    end
  end
end
