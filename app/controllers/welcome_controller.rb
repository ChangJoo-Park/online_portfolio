class WelcomeController < ApplicationController
  include ApplicationHelper

  def index
    render layout: 'welcome'
  end
end
