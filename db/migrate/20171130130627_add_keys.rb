class AddKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key "api_v1_word_list_items", "api_v1_word_lists", column: "word_list_id", name: "api_v1_word_list_items_word_list_id_fk"
    add_foreign_key "api_v1_word_lists", "users", name: "api_v1_word_lists_user_id_fk"
  end
end
