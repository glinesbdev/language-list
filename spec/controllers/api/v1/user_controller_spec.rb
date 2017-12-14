require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :controller do
	def user
		build(:user)
	end

	def user_params
		{
			username: user.username,
			email: user.email,
			password: user.password,
			password_confirmation: user.password_confirmation,
			admin: false
		}
	end

	def created_user
		User.create(user_params)
	end

	def parsed_response
		JSON.parse(response.body)
	end

	def setup
		login_with user
		created_user
	end

	def teardown
		if created_user.errors.any?
			p created_user.errors.full_messages
		end

		User.destroy_all
	end

	before :each do
		setup
	end

	after :all do
		teardown
	end

	describe 'GET /user.json' do
		before do 
			get :index, format: :json
		end

		include_examples 'default responses'

		it 'should return a list of users' do
			expect(parsed_response.any?).to eq(true)
		end
	end

	describe 'GET /user/:id.json' do
		before do
			get :show, { params: { id: User.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should return a single user' do
			expect(parsed_response.count).to eq(1)
		end
	end

	describe 'POST /user.json' do
		before do
			get :create, { params: { email: 'test2@email.com', admin: true, password: 'testpass', password_confirmation: 'testpass' }, format: :json }
		end

		include_examples 'default responses'

		it 'should create a new user' do
			expect(parsed_response['user']['email']).to eq('test2@email.com')
			expect(parsed_response['user']['admin']).to be_truthy
		end
	end

	describe 'PATCH /user/:id.json' do
		before do
			patch :update, { params: { id: User.first.id, email: 'updated@email.com' }, format: :json }
		end

		include_examples 'default responses'

		it 'should update a user' do
			# Checking for UID since you have to click the welcome email link again to change the password
			expect(parsed_response['user']['uid']).to eq('updated@email.com')
		end
	end

	describe 'DELETE /user/:id.json' do
		before do
			delete :destroy, { params: { id: User.first.id }, format: :json }
		end

		include_examples 'default responses'

		it 'should display a message' do
			expect(parsed_response['message']).to eq('test@email.com was deleted')
		end

		it 'should delete a user' do
			expect(User.first).to be_nil
		end
	end
end
