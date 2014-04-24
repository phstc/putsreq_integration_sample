require 'spec_helper'

describe 'Schedulers', type: :feature do
  it 'calls "API" every 10.minutes' do
    # See rake schedulers:get_server_time
    response = HTTParty.get('http://putsreq.com/cAHupZ9LG5B0rXrbPs0X/last')

    expect(Time.parse(response['created_at'])).to be > Time.now - 600 # 10.minutes
  end
end
