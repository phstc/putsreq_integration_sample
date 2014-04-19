require 'spec_helper'

describe 'Checks schedulers', type: :feature do
  it 'checks if a call was made in less than 10.minutes.from_now' do
    # see bin/get_server_time
    response = HTTParty.get('http://putsreq.com/cAHupZ9LG5B0rXrbPs0X/last')

    # check if the scheduler called PutsReq in less than 10.minutes.from_now
    expect(Time.parse(response['created_at'])).to be > Time.now - 600 # 10.minutes
  end
end
