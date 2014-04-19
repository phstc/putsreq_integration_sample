require 'httparty'

namespace :schedulers do
  task :get_server_time do
    # this file is called by heroku every 10 minutes
    # response builder on PutsReq `response.body = new Date().getTime();`

    # config = YAML::load_file(File.join(__dir__, 'config.yml'))
    # url = config[MY_APPLICATION_ENV][get_server_time]
    url = 'http://putsreq.com/cAHupZ9LG5B0rXrbPs0X'

    response = HTTParty.get(url)

    puts response.body
  end
end
