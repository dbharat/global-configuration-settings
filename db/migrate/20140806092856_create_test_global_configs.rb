class CreateTestGlobalConfigs < ActiveRecord::Migration
  def change
    create_table :test_global_configs do |t|
      t.string :name, index: true, null: false
      t.string :value, null: false
      t.integer :value_type, null: false
      t.timestamps
    end
  end
end
