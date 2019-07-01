class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :novel_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
