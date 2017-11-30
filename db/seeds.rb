# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user = User.create(email: 'test@email.com', username: 'test', password: 'asdf1!')

word_list = Api::V1::WordList.create(name: 'Common Words', language: 'German')

user.word_lists << word_list
user.save

[ 
	{ word: 'hallo', translation: 'hello', context: 'Hallo und Wilkommen!', word_list_id: user.word_lists.first.id },
	{ word: 'gut', translation: 'good', context: 'Gut essen!', word_list_id: user.word_lists.first.id }
].each { |attr| Api::V1::WordListItem.create(attr) }