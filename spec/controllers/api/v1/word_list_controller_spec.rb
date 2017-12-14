require 'rails_helper'

RSpec.describe Api::V1::WordListController, type: :controller do
	before :each do
		user = create(:user)
		word_list = create(:word_list)
		list_item = build(:word_list_item)

		word_list.word_list_items << list_item
		user.word_lists << word_list

		login_with user
	end

	after :all do
		Api::V1::WordList.delete_all
		User.delete_all
	end

	def parsed_response
		JSON.parse(response.body)
	end

	describe 'GET /word_list.json' do
		before do
			get :index, format: :json
		end

		include_examples 'default responses'

		it 'renders the index template' do
  			expect(response).to render_template(:index)
		end

		it 'has a list of items' do
			parsed_response = JSON.parse(response.body)
			expect(parsed_response.first['list']['items'].count).to eq(1)
		end
	end

	describe 'GET /word_list/:id.json' do
		before do
			get :show, { params: { id: Api::V1::WordList.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should render the show template' do
			expect(response).to render_template(:show)
		end

		it 'should get a single word list' do
			expect(parsed_response.count).to eq(1)
		end
	end

	describe 'POST /word_list/.json' do
		before do
			post :create, { params: { name: 'Test List', language: 'Test Language' }, format: :json }
		end

		include_examples 'default responses'

		it 'should render the show template' do
			expect(response).to render_template(:show)
		end

		it 'should create a new word list' do
			expect(parsed_response['list']['id']).to_not be_nil
			expect(parsed_response['list']['name']).to eq('Test List')
			expect(parsed_response['list']['language']).to eq('Test Language')
		end
	end

	describe 'PATCH /word_list/:id.json' do
		before do
			patch :update, { params: { id: Api::V1::WordList.first.id, name: 'Super Test' }, format: :json }
		end

		include_examples 'default responses'

		it 'should render the show template' do
			expect(response).to render_template(:show)
		end

		it 'should update an existing word list' do
			expect(parsed_response['list']['name']).to eq('Super Test')
		end
	end

	describe 'DELETE /word_list/:id.json' do
		before do
			delete :destroy, { params: { id: Api::V1::WordList.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should render a message' do
			expect(parsed_response['message']).to eq('Factory List has been deleted.')
		end

		it 'should delete a word list' do
			expect(Api::V1::WordList.first).to be_nil
		end
	end
end
