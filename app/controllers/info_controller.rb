class InfoController < ApplicationController
  before_action :authenticate_user!
  def about
  end

  def history
  end

  def culture
  end
end
