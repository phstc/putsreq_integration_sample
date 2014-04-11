module FeatureHelpers
  def session
    @session ||= Capybara::Session.new(:poltergeist)
  end
end
