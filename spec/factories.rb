FactoryBot.define do
	factory :admin, class: :user do
		id 1
		email 'admin@email.com'
		username 'admin'
		password 'secure'
		password_confirmation 'secure'
		admin true
	end

	factory :user do
		id 2
		email 'test@email.com'
		username 'user'
		password 'superpass!'
		password_confirmation 'superpass!'
		uid 'test@email.com'
		created_at DateTime.now
		updated_at DateTime.now
		admin false
	end

	factory :word_list, class: Api::V1::WordList do
		id 1
		name 'Factory List'
		language 'German'
		user_id 2
		created_at DateTime.now
		updated_at DateTime.now
	end

	factory :word_list_item, class: Api::V1::WordListItem do
		id 1
		word 'gut'
		translation 'good'
		context 'Gut essen!'
		word_list_id 1
		created_at DateTime.now
		updated_at DateTime.now
	end
end