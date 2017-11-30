class CreateApiV1WordLists < ActiveRecord::Migration[5.1]
  def up
    create_table :api_v1_word_lists do |t|
    	t.string :name, unique: true
    	t.string :language
      t.integer :user_id

      t.timestamps
    end
  end

  def down
  	drop_table :api_v1_word_lists
  end
end
