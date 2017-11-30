json.id @word_list.id
json.name @word_list.name
json.language @word_list.language

json.items @word_list.word_list_items, :word, :translation, :context

json.user current_user

json.url word_lists_url(@word_list, format: :json)