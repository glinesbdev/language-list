RSpec.shared_examples 'default responses' do
	it 'should be a successful 200 response' do
		expect(response).to be_success
	end

	it 'should be a json response' do
		expect(response.content_type).to eq('application/json')
	end
end