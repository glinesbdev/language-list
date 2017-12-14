require 'rails_helper'

RSpec.describe Api::V1::WordListController, type: :controller do
	before :each do
		@user = build(:user)
		@word_list = build(:word_list)
		@list_item = build(:word_list_item)

		@word_list.word_list_items << @list_item
		@user.word_lists << @word_list

		login_with @user
	end

	describe 'GET /word_list.json' do
		before do
			get :index, format: :json
		end

		it 'returns a successful 200 response' do
			expect(response).to be_success
		end

		it 'expects a json response' do
			expect(response.content_type).to eq('application/json')
		end

		it 'renders the index template' do
  			expect(response).to render_template(:index)
		end

		it 'has a list of items' do
			parsed_response = JSON.parse(response.body)
			expect(parsed_response.first['list']['items'].count).to eq(1)
		end
	end
end
