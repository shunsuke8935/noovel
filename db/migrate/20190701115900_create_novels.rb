class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :synopsis
      t.string :genre
      t.string :title

      t.timestamps
    end
  end
end
