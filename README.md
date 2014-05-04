[![Build Status](https://travis-ci.org/phstc/putsreq_integration_sample.svg)](https://travis-ci.org/phstc/putsreq_integration_sample)

## PutsReq - Sample end-to-end tests

Sample end-to-end tests using [PutsReq](http://putsreq.com).

### Tests

Check [spec/acceptance](https://github.com/phstc/putsreq_integration_sample/tree/master/spec/acceptance) to see the test samples.

### Integration with Travis and Capistrano.

Here's an example you can use to trigger an end-to-end test project on [travis](https://travis-ci.org) after every deploy with Capistrano.

```ruby
require 'travis/pro'

set :travis_repository,  'phstc/putsreq_integration_sample'
set :travis_token,       '...' # Travis Token http://blog.travis-ci.com/2013-01-28-token-token-token/

namespace :travis do
  task :build do
    on :local do
      Travis::Pro.access_token = fetch(:travis_token)
      repo = Travis::Pro::Repository.find(fetch(:travis_repository))
      repo.last_build.restart

      info "Building #{fetch(:travis_repository)} on travis"
    end
  end
end

after 'deploy', 'travis:build'
```