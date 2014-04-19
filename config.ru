require 'sinatra'
require 'httparty'
require 'erb'

class PutsReqApp < Sinatra::Base
  enable :inline_templates

  get '/' do
    erb :index
  end

  post '/' do
    # config = YAML::load_file(File.join(__dir__, 'config.yml'))
    # url = config[MY_APPLICATION_ENV][create_user_url]
    url = 'http://putsreq.com/zkmR5wLyJxazejKtDmca'

    response = HTTParty.post(url,
                             body: { user: { name: params[:user_name] } }.to_json,
                             headers: { 'Content-Type' => 'application/json' })

    @message = response['message']

    erb :show
  end
end

run PutsReqApp.new

__END__

@@ layout
<html>
  <head>
    <title>PutsReq</title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@ index
<form action="/" method="POST">
  <label for="name">Name</label><input type="text" name="user_name">
  <button type="submit">Create User</button>
</form>

@@ show
<%= @message %>
