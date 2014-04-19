require 'spec_helper'

describe 'Sends new users to the "API"', type: :feature do
  it 'creates and show welcome' do
    session.visit '/'

    name = Faker::Name.name
    session.fill_in 'user_name', with: name
    session.click_button 'Create User'
    # response builder on PutsReq
    # response.status = 200;
    # response.headers['Content-Type'] = 'application/json';
    # var user = JSON.parse(request.body)['user'];
    # response.body = { message: 'Hello World ' + user['name'] };

    # test the view
    expect(session).to have_content "Hello World #{name}"

    response = HTTParty.get('http://putsreq.com/zkmR5wLyJxazejKtDmca/last')

    payload = JSON.parse(response['body'])

    # check if the request was made with correct data
    expect(payload['user']['name']).to eq name
  end
end
