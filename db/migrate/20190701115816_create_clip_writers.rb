class CreateClipWriters < ActiveRecord::Migration[5.2]
  def change
    create_table :clip_writers do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
