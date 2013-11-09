class MyDevise::RegistrationsController < Devise::RegistrationsController
  protected
  def after_update_path_for(resource)
    projects_path
  end

end
