require 'rails_helper'

RSpec.describe User, type: :model do
	context 'non-admin user' do
	  describe 'email address' do
	  	it 'has an email' do
	  		user = build(:user)
	  		result = user.email
	  		expect(result).to_not eq(nil)
	  	end
	  end

	  describe 'username' do
	  	it 'has a username' do
	  		user = build(:user)
	  		result = user.username
	  		expect(result).to_not eq(nil)
	  	end
	  end

	  describe 'admin' do
	  	it 'is not an admin' do
	  		user = build(:user)
	  		result = user.admin
	  		expect(result).to eq(false)
	  	end
	  end
	end

	context 'admin user' do
		describe 'admin' do
			it 'is an admin' do
				user = build(:admin)
				result = user.admin
				expect(result).to eq(true)
			end
		end
	end
end
