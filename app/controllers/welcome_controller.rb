class WelcomeController < ApplicationController
  include ApplicationHelper

  def index
    render layout: 'welcome'
  end

  def about
    render layout: 'welcome'
  end

  def contact
    render layout: 'welcome'
  end

end
