class CreateClipWriters < ActiveRecord::Migration[5.2]
  def change
    create_table :clip_writers, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
