class FacebookController < ApplicationController
  after_action :allow_facebook_iframe

private

  def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://apps.facebook.com'
  end
end