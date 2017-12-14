require 'rails_helper'

RSpec.describe Api::V1::WordListItemController, type: :controller do
	before :each do
		user = create(:user)
		word_list = create(:word_list)
		word_list_item = create(:word_list_item)

		word_list.word_list_items << word_list_item
		user.word_lists << word_list

		login_with user
	end

	after :all do
		Api::V1::WordList.delete_all
		Api::V1::WordListItem.delete_all
		User.delete_all
	end

	def parsed_response
		JSON.parse(response.body)
	end

	describe 'GET /word_list_item.json' do
		before do
			get :index, format: :json
		end

		include_examples 'default responses'

		it 'should get a list of word list items' do
			expect(parsed_response.any?).to eq(true)
		end
	end

	describe 'GET /word_list_item/:id.json' do
		before do
			get :show, { params: { id: Api::V1::WordListItem.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should get a single word list item' do
			expect(parsed_response['item']).to_not be_nil
		end
	end

	describe 'POST /word_list_item.json' do
		before do
			post :create, { params: { word: 'freundin', translation: 'girlfriend', context: 'Meine freundin', word_list_id: Api::V1::WordList.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should create a new word list item' do
			expect(parsed_response['item']['id']).to_not be_nil
			expect(parsed_response['item']['word']).to eq('freundin')
			expect(parsed_response['item']['translation']).to eq('girlfriend')
			expect(parsed_response['item']['context']).to eq('Meine freundin')
			expect(parsed_response['item']['word_list_id']).to eq(10)
		end
	end

	describe 'DELETE /word_list_item/:id.json' do
		before do
			delete :destroy, { params: { id: Api::V1::WordListItem.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should display a message' do
			expect(parsed_response['message']).to eq('gut was deleted')
		end

		it 'should delete a word list item' do
			expect(Api::V1::WordListItem.first).to be_nil
		end
	end
end