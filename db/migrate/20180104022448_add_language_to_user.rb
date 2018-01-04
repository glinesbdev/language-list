class AddLanguageToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :language, :string
  end

  def down
    remove_column :users, :language
  end
end
