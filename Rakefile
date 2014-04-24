require 'httparty'

namespace :schedulers do
  task :get_server_time do
    # this task is called by Heroku every 10 minutes
    # PutsReq Response Builder
    # response.body = new Date().getTime();

    # config = YAML::load_file(File.join(__dir__, 'config.yml'))
    # url = config[MY_APPLICATION_ENV][get_server_time]
    url = 'http://putsreq.com/cAHupZ9LG5B0rXrbPs0X'

    response = HTTParty.get(url)

    puts response.body
  end
end
