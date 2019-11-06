require 'rails_helper'

RSpec.describe "users spec" do
	it "should create a user and return an api key, and log in that user" do

		body = {
			"email": "whatever@example.com",
			"password": "password",
			"password_confirmation": "password"
			}

		req = post "/api/v1/users", params: body.to_json
		data = JSON.parse(response.body, symbolize_names: true)

		expect(req).to eq(201)
		expect(data).to have_key(:api_key)
		
		api_key = data[:api_key]

		body_2 = {
			"email": "whatever@example.com",
			"password": "password"
			}

		headers = { "CONTENT_TYPE" => "application/json" }

		req_2 = post "/api/v1/sessions", params: body_2.to_json, headers: headers
		data_2 = JSON.parse(response.body, symbolize_names: true, quirks_mode: true)

		expect(req_2).to eq(201)
		expect(data_2[:api_key]).to eq(api_key)
	end

	it 'should not create a user with bad credentials' do
		body = {
			"email": "whatever@example.com",
			"password": "password",
			"password_confirmation": "password"
			}

		post "/api/v1/users", params: body.to_json

		body_2 = {
			"email": "whatever@example.com",
			"password": "password",
			"password_confirmation": "password"
			}

		req = post "/api/v1/users", params: body_2.to_json
		data = JSON.parse(response.body, symbolize_names: true)

		expect(req).to eq(400)
		expect(data).to eq({message: 'Could not create user'})
	end

	it 'should not log in a user with bad credentials' do
		body = {
			"email": "whatever@example.com",
			"password": "password",
			"password_confirmation": "password"
			}

		post "/api/v1/users", params: body.to_json

		body_2 = {
			"email": "whatever@example.com",
			"password": "notpassword"
			}

		headers = { "CONTENT_TYPE" => "application/json" }

		req_2 = post "/api/v1/sessions", params: body_2.to_json, headers: headers
		data_2 = JSON.parse(response.body, symbolize_names: true, quirks_mode: true)

		expect(req_2).to eq(400)
		expect(data_2).to eq({message: 'Could not log in'})
	end
end