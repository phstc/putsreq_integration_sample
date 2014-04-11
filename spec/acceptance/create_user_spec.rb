require 'spec_helper'

describe 'Sends new users to the "API"', type: :feature do
  it 'creates and show welcome' do
    session.visit '/'

    name = Faker::Name.name
    session.fill_in 'user_name', with: name
    session.click_button 'Create User'

    # test the view
    expect(session).to have_content "Hello World #{name}"

    response = HTTParty.get('https://putsreq.herokuapp.com/5352b1c8894deaf810000026/last')

    payload = JSON.parse(response['body'])

    # check if the request was made with correct data
    expect(payload['user']['name']).to eq name
  end
end
