class AddDePageIdToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :page_id, :integer
  end
end
