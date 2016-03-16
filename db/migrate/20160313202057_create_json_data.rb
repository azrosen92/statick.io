class CreateJsonData < ActiveRecord::Migration
  def change
    create_table :json_data do |t|
      t.string :endpoint
      t.text :data
      t.datetime :last_accessed

      t.timestamps null: false
    end
  end
end
