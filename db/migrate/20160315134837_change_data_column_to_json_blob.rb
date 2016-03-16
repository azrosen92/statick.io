class ChangeDataColumnToJsonBlob < ActiveRecord::Migration
  def change
    rename_column :json_data, :data, :json_blob
  end
end
