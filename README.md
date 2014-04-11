Sample Integration Test Project using [PutsReq](https://putsreq.com).

### Tests

Check [spec/acceptance](https://github.com/phstc/putsreq_integration_sample/tree/master/spec/acceptance) to see the tests samples.

### Integration with Travis and Capistrano.

Here's an example you can use to trigger an Integration Test on travis after every deploy with Capistrano.

```ruby
require 'travis/pro'

set :travis_repository,   'phstc/putsreq_integration_sample'
set :travis_github_auth,  '...' # Travis Token on GitHub

namespace :travis do
  task :build do
    on :local do
      Travis::Pro.github_auth(fetch(:travis_github_auth))
      repo = Travis::Pro::Repository.find(fetch(:travis_repository))
      repo.last_build.restart

      info "Building #{fetch(:travis_repository)} on travis"
    end
  end
end

after 'deploy', 'travis:build'
```

#### .travis.yml

```yaml
script:
  - 'bundle exec rspec'

env:
  - WEBSITE_URL='https://production.example.com'
  - WEBSITE_URL='https://staging.example.com'

branches:
  only:
    - master
rvm:
  - 2.0.0
```