Api::V1::WordListItem.delete_all
Api::V1::WordList.delete_all
User.delete_all

user = User.create(email: 'test@email.com', username: 'test', password: 'superpass!', password_confirmation: 'superpass!')
word_list = Api::V1::WordList.create(name: 'Common Words', language: 'German', user_id: user.id)

unless user.errors.full_messages.count > 0
	user.save
else
	puts user.errors.full_messages
end

[ 
	{ word: 'hallo', translation: 'hello', context: 'Hallo und Willkommen!', word_list_id: word_list.id },
	{ word: 'gut', translation: 'good', context: 'Gut essen!', word_list_id: word_list.id }
].each { |attr| Api::V1::WordListItem.create(attr) }