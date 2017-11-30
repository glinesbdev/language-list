class CreateApiV1WordListItems < ActiveRecord::Migration[5.1]
  def up
    create_table :api_v1_word_list_items do |t|
    	t.string :word
    	t.string :translation
    	t.text :context
    	t.integer :word_list_id

      t.timestamps
    end
  end

  def down
  	drop_table :api_v1_word_list_items
  end
end
