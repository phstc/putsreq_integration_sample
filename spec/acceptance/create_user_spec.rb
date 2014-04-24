require 'spec_helper'

describe 'User creation', type: :feature do
  it 'shows welcome and sends new users to the "API"' do
    session.visit '/'

    name = Faker::Name.name
    session.fill_in 'user_name', with: name
    session.click_button 'Create User'

    # PustReq Response Builder
    # response.status = 200;
    # response.headers['Content-Type'] = 'application/json';
    # var user = JSON.parse(request.body)['user'];
    # response.body = { message: 'Hello World ' + user['name'] };

    expect(session).to have_content "Hello World #{name}"

    response = HTTParty.get('http://putsreq.com/zkmR5wLyJxazejKtDmca/last')

    payload = JSON.parse(response['body'])

    # check if the "API" received the new user
    expect(payload['user']['name']).to eq name
  end
end
