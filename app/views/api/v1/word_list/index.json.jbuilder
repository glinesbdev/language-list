json.array! @word_lists do |list|
	json.list list.to_builder
	# json.id list.id
	# json.name list.name
	# json.language list.language
	# json.items list.word_list_items, :word, :translation, :context
	# json.user current_user
	# json.url word_list_url(list, format: :json)
end