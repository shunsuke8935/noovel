class AddNullToPage < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :pages, :title, false
  	change_column_null :pages, :text, false
  	change_column_null :novels, :title, false
  	change_column_null :novels, :synopsis, false
  end
end
